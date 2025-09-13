import 'package:flutter/material.dart';

class MealsDetailsItemTrait extends StatelessWidget {
  final String label;
  final List<String> items;
  const MealsDetailsItemTrait({
    super.key,
    required this.label,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        Column(
          spacing: 10,
          children: [
            for (String item in items)
              Text(
                item,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ],
    );
  }
}
