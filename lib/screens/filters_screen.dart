import 'package:flutter/material.dart';
import '/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/Filters';
  final Map<String, bool> currentFilter;
  final Function saveFilters;
  FiltersScreen(this.currentFilter, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactosefree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    _lactosefree = widget.currentFilter['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
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
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactosefree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  _glutenFree,
                  (newvalue) {
                    setState(
                      () {
                        _glutenFree = newvalue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'vegetarian',
                  _vegetarian,
                  (newvalue) {
                    setState(
                      () {
                        _vegetarian = newvalue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'vegan',
                  _vegan,
                  (newvalue) {
                    setState(
                      () {
                        _vegan = newvalue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  _lactosefree,
                  (newvalue) {
                    setState(
                      () {
                        _lactosefree = newvalue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
