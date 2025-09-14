import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/filter_item.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters")),
      body: Column(
        children: [
          FilterItem(
            label: 'Gluten-free',
            initialState: currentFilters[Filter.glutenFree]!,
            updatetate: (isChanged) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChanged);
            },
          ),
          FilterItem(
            label: 'Latose-free',
            initialState: currentFilters[Filter.latoseFree]!,
            updatetate: (isChanged) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.latoseFree, isChanged);
            },
          ),
          FilterItem(
            label: 'Vegetarian',
            initialState: currentFilters[Filter.vegetarian]!,
            updatetate: (isChanged) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.latoseFree, isChanged);
            },
          ),
          FilterItem(
            label: 'Vegan',
            initialState: currentFilters[Filter.vegan]!,
            updatetate: (isChanged) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.latoseFree, isChanged);
            },
          ),
        ],
      ),
    );
  }
}
