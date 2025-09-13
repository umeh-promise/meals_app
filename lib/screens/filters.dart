import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_item.dart';

enum Filter { glutenFree, latoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  final Map<Filter, bool> currentFilter;
  const FiltersScreen({super.key, required this.currentFilter});

  @override
  State<FiltersScreen> createState() {
    return _FiilterScreenState();
  }
}

class _FiilterScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _latoseFreeFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  @override
  void initState() {
    _glutenFreeFilterSet = widget.currentFilter[Filter.glutenFree]!;
    _latoseFreeFilterSet = widget.currentFilter[Filter.latoseFree]!;
    _vegetarianFilterSet = widget.currentFilter[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilter[Filter.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters")),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     setState(() {
      //       Navigator.pop(context);
      //       if (identifier == 'meals') {
      //         Navigator.of(
      //           context,
      //         ).push(MaterialPageRoute(builder: (ctx) => TabsScreen()));
      //       }
      //     });
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.latoseFree: _latoseFreeFilterSet,
            Filter.vegetarian: _veganFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            FilterItem(
              label: 'Gluten-free',
              initialState: _glutenFreeFilterSet,
              updatetate: (isChanged) {
                setState(() {
                  _glutenFreeFilterSet = isChanged;
                });
              },
            ),
            FilterItem(
              label: 'Latose-free',
              initialState: _latoseFreeFilterSet,
              updatetate: (isChanged) {
                setState(() {
                  _latoseFreeFilterSet = isChanged;
                });
              },
            ),
            FilterItem(
              label: 'Vegetarian',
              initialState: _vegetarianFilterSet,
              updatetate: (isChanged) {
                setState(() {
                  _vegetarianFilterSet = isChanged;
                });
              },
            ),
            FilterItem(
              label: 'Vegan',
              initialState: _veganFilterSet,
              updatetate: (isChanged) {
                setState(() {
                  _veganFilterSet = isChanged;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
