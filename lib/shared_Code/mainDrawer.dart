import 'package:flutter/material.dart';
import 'package:meal_app_like_foodpanda/screens/filtersScreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, Icon icon, Function tapScreen) {
      return ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'RobotoCondensed',
          ),
        ),
        onTap: tapScreen,
      );
    }

    return Drawer(
      child: Column(
        children: [
          // =====================================
          // Above Container for heading
          // =====================================
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w900,
                // fontFamily: 'RobotoCondensed',
                color: Colors.redAccent,
              ),
            ),
          ),
          // =====================================
          //              FOR SPACING
          // =====================================
          SizedBox(
            height: 20.0,
          ),
          // =====================================
          // List of Items want to store in drawer
          // =====================================
          buildListTile(
            'Meal',
            Icon(Icons.restaurant),
              ()=> Navigator.of(context).pushReplacementNamed('/'),
          ),
          // =====================================
          // List of Items want to store in drawer
          // =====================================
          buildListTile(
            'Filters',
            Icon(Icons.settings),
                ()=> Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
