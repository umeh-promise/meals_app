import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  final String label;
  final bool initialState;
  final void Function(bool state) updatetate;
  const FilterItem({
    super.key,
    required this.label,
    required this.initialState,
    required this.updatetate,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: initialState,
      onChanged: (isChecked) {
        updatetate(isChecked);
      },
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        'Only include $label meals'.toLowerCase(),
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      activeThumbColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 34, right: 24),
    );
  }
}
