import 'package:flutter/material.dart';
import 'package:meal_app_like_foodpanda/shared_Code/mainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters,this.saveFilters);


  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  void initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }
  Widget _buildSwitchListTile(BuildContext context, String title,
      String subtitle, bool value, Function updateFunction) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: updateFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(icon: Icon(Icons.save_outlined,size: 30,),
              onPressed: (){
              final selectedFilters =  {
                  'gluten': _glutenFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                  'lactose': _lactoseFree,
                };
            widget.saveFilters(selectedFilters);
          }
            ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          // ==========================
          // FOR HEADING OF PAGE SETTINGS
          // ==========================
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Adjust your meal settings',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          // ==============================
          // FOR LIST OF SWITCH LIST TILES
          // ==============================
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(context, 'Gluten Free',
                    'Only include Glutten Free Meal', _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                    print(value);
                  });
                }),
               // Second values
                _buildSwitchListTile(context, 'Vegan',
                    'Only include Vegan Meal', _vegan, (value) {
                      setState(() {
                        _vegan = value;
                        print(value);
                      });
                    }),
                _buildSwitchListTile(context, 'Vegetarian',
                    'Only include Vegetarian Food', _vegetarian, (value) {
                      setState(() {
                        _vegetarian = value;
                        print(value);
                      });
                    }),
                _buildSwitchListTile(context, 'Lactose Free',
                    'Only include Lactose Free Meal', _lactoseFree, (value) {
                      setState(() {
                        _lactoseFree = value;
                        print(value);
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
