import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filters';

  final saveFilters;
  final currentFilter;

  FiltersScreen(this.currentFilter,this.saveFilters,);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  initState(){
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilter = {
                    'gluten' : _glutenFree,
                    'lactose' : _lactoseFree,
                    'vegetarian' : _vegetarian,
                    'vegan' : _vegan,
                  };
                  widget.saveFilters(selectedFilter);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: ListView(
                children: [
                  // Gluten-free SwitchListTile Filter
                  _buildSwitchListTile(
                      'Gluten-free', 'Only include gluten-free', _glutenFree,
                      (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),

                  // Lactose SwitchListTile Filter
                  _buildSwitchListTile(
                      'Lactose-free', 'Only include Lactose-free', _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),

                  // Vegetarian SwitchListTile Filter
                  _buildSwitchListTile(
                      'Vegetarian', 'Only include Vegetarian', _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),

                  // Vegan SwitchListTile Filter
                  _buildSwitchListTile('Vegan', 'Only include Vegan', _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
