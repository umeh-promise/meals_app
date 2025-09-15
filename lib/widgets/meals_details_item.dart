import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_details_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsDetailsItem extends StatelessWidget {
  final Meal meal;
  const MealsDetailsItem(this.meal, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // spacing: 25,
      // mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Hero(
          tag: meal.id,
          child: FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 250,
            width: double.infinity,
            color: const Color.fromARGB(77, 63, 49, 8),
            colorBlendMode: BlendMode.multiply,
          ),
        ),
        const SizedBox(height: 25),
        MealsDetailsItemTrait(label: 'Ingredients', items: meal.ingredients),
        const SizedBox(height: 25),
        MealsDetailsItemTrait(label: 'Steps', items: meal.steps),
      ],
    );
  }
}
