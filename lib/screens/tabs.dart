import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.latoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;
  Map<Filter, bool> _selectedFilterResult = kInitialFilters;
  final List<Meal> _favouriteMeals = [];

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 18, 17, 15),
          ),
        ),
      ),
    );
  }

  void _toggleMeatStatus(Meal meal) {
    final bool isExisiting = _favouriteMeals.contains(meal);

    setState(() {
      if (isExisiting) {
        _favouriteMeals.remove(meal);
        _showSnackbar("Item removed from favourites");
      } else {
        _favouriteMeals.add(meal);
        _showSnackbar("Mark as favourite");
      }
    });
  }

  void _selectedPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) =>
              FiltersScreen(currentFilter: _selectedFilterResult),
        ),
      );
      setState(() {
        _selectedFilterResult = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final avaliableMeals = dummyMeals.where((meal) {
      if (_selectedFilterResult[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilterResult[Filter.latoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilterResult[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilterResult[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavourite: _toggleMeatStatus,
      avaliableMeals: avaliableMeals,
    );
    String activePageTitle = 'Categories';

    if (_selectPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMeatStatus,
      );
      activePageTitle = "Favourites";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      drawer: MainDrawer(onSelectScreen: _setScreen),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
        onTap: (index) {
          _selectedPage(index);
        },
      ),
    );
  }
}
