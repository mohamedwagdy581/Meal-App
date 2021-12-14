import 'package:flutter/material.dart';
import 'package:meal_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(IconData icon, String title, Function tapHandler) {
    return ListTile(
        leading: Icon(
        icon,
        size: 26.0,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: ()=> tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            color: Theme.of(context).accentColor,
            height: 120.0,
            width: double.infinity,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),

          // Meal ListTile
          buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),

          // Filter ListTile
          buildListTile(Icons.settings, 'Filter', () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);
          }),
        ],
      ),
    );
  }
}
