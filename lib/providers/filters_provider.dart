import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter { glutenFree, latoseFree, vegetarian, vegan }

class FiltersProviderNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersProviderNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.latoseFree: false,
        Filter.vegan: false,
        Filter.vegetarian: false,
      });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProviderNotifier, Map<Filter, bool>>(
      (ref) => FiltersProviderNotifier(),
    );

final filterMealsProvider = Provider<List<Meal>>((ref) {
  final meals = ref.watch(mealsProvider);
  final chosenFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (chosenFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (chosenFilters[Filter.latoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (chosenFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (chosenFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
