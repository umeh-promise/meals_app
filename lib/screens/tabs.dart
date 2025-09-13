import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int _selectPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = Categories();
    String activePageTitle = 'Categories';

    if (_selectPageIndex == 1) {
      activePage = Meals(meals: []);
      activePageTitle = "Favourites";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
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
