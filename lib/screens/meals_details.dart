import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_details_item.dart';

class MealsDetailsScreen extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;
  const MealsDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title, maxLines: 1),
        actions: [
          IconButton(
            onPressed: () => onToggleFavourite(meal),
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: MealsDetailsItem(meal),
    );
  }
}
