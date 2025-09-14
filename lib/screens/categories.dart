import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> avaliableMeals;

  const CategoriesScreen({super.key, required this.avaliableMeals});

  void _handleSelectCategory(BuildContext context, Category category) {
    // Navigator.push(context, route)

    final List<Meal> filteredMeals = avaliableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            MealsScreen(title: category.title, meals: filteredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (Category category in availableCategories)
          CategoryItem(
            category: category,
            key: ValueKey(category.id),
            onSelectCategory: () => _handleSelectCategory(context, category),
          ),
      ],
    );
  }
}
