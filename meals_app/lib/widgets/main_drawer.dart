import 'package:flutter/material.dart';
import 'package:meals_app/screen/filters.dart';

class MainDrawer extends StatelessWidget {
  _listItem(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _listItem(
            'Meal',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('+');
            },
          ),
          _listItem(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(Filters.routeName);
            },
          ),
        ],
      ),
    );
  }
}
