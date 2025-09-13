import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_details_item.dart';

class MealsDetails extends StatelessWidget {
  final Meal meal;
  const MealsDetails({super.key, required this.meal});

  void _handleAddFavourite(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Marked as favourite',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 18, 17, 15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title, maxLines: 1),
        titleSpacing: 4,
        actions: [
          IconButton(
            onPressed: () => _handleAddFavourite(context),
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: MealsDetailsItem(meal),
    );
  }
}
