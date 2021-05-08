import 'package:flutter/material.dart';
import 'package:meals/widget/ma%C4%B1n_drawer.dart';

class Filters extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  Filters(this.currentFilters, this.saveFilters);

  static const routeName = 'filters';

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _qlutenFree = false;

  var _vegeterianFree = false;

  var _vegan = false;

  var _loctoseFree = false;

  @override
  initState() {
    _qlutenFree = widget.currentFilters['gluten'];
    _vegeterianFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _loctoseFree = widget.currentFilters['vegeterian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String des, bool qlutenFree, Function updatevalue) {
    return Expanded(
        child: ListView(
      children: [
        SwitchListTile(
            value: qlutenFree,
            title: Text(title),
            subtitle: Text(des),
            onChanged: updatevalue)
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('your filter'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> _selectedFilters = {
                  'gluten': _qlutenFree,
                  'lactose': _loctoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterianFree,
                };

                widget.saveFilters(_selectedFilters);
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Meal Selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          _buildSwitchListTile(
              'Gluten Free', 'only include gluten free meals', _qlutenFree,
              (newVlue) {
            setState(() {
              _qlutenFree = newVlue;
            });
          }),
          _buildSwitchListTile(
              'Loctose Free ', 'only include Loctose free meals', _loctoseFree,
              (newVlue) {
            setState(() {
              _loctoseFree = newVlue;
            });
          }),
          _buildSwitchListTile('Vegeterian Free',
              'only include vegeterian free meals', _vegeterianFree, (newVlue) {
            setState(() {
              _vegeterianFree = newVlue;
            });
          }),
          _buildSwitchListTile(
              'Vegan Free', 'only include Vegan free meals', _vegan, (newVlue) {
            setState(() {
              _vegan = newVlue;
            });
          }),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
