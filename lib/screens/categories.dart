import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  void _handleSelectCategory(
    BuildContext context,
    Category category,
    List<Meal> meals,
  ) {
    // Navigator.push(context, route)
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Meals(title: category.title, meals: meals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick your category')),
      body: GridView(
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
              onSelectCategory: _handleSelectCategory,
            ),
        ],
      ),
    );
  }
}
