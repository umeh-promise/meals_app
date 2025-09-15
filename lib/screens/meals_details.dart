import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favourite_meals_provider.dart';
import 'package:meals_app/widgets/meals_details_item.dart';

class MealsDetailsScreen extends ConsumerWidget {
  final Meal meal;
  const MealsDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);

    final mealIsFavorite = favouriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title, maxLines: 1),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favouriteMealsProvider.notifier)
                  .toggleMealFavouriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded
                        ? "Meal added to favourite"
                        : "Meal removed from favourite",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 18, 17, 15),
                    ),
                  ),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Icon(
                mealIsFavorite ? Icons.star : Icons.star_outline,
                key: ValueKey(mealIsFavorite),
              ),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween<double>(begin: 0.7, end: 1.0).animate(animation),
                child: child,
              ),
            ),
          ),
        ],
      ),
      body: MealsDetailsItem(meal),
    );
  }
}
