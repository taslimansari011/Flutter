import 'package:flutter/material.dart';
import 'package:meals_app/model/global_filters.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = 'filters_screen';

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  // bool isGlutenFree = false;
  // bool isVegan = false;
  // bool isVegetarian = false;
  // bool isLactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String subTitle,
    bool state,
  ) {
    return SwitchListTile(
      value: state,
      onChanged: (value) {
        setState(() {
          state = value;
        });
      },
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your filters',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                // _buildSwitchListTile(
                //   'Gluten Free',
                //   'Include gluten free meals.',
                //   GlobalFilters.isGlutenFree,
                // ),
                // _buildSwitchListTile(
                //   'Vegan',
                //   'Include vegan meals.',
                //   GlobalFilters.isVegan,
                // ),
                // _buildSwitchListTile(
                //   'Vegetarian',
                //   'Include vegetarian meals.',
                //   GlobalFilters.isVegetarian,
                // ),
                // _buildSwitchListTile(
                //   'Lactose Free',
                //   'Include lactose free meals.',
                //   GlobalFilters.isLactoseFree,
                // ),
                SwitchListTile(
                  value: GlobalFilters.isGlutenFree,
                  onChanged: (value) {
                    setState(() {
                      GlobalFilters.isGlutenFree = value;
                    });
                  },
                  title: Text('Gluten Free'),
                  subtitle: Text('Include gluten free meals.'),
                ),
                SwitchListTile(
                  value: GlobalFilters.isVegan,
                  onChanged: (value) {
                    setState(() {
                      GlobalFilters.isVegan = value;
                    });
                  },
                  title: Text('Vegan'),
                  subtitle: Text('Include vegan meals.'),
                ),
                SwitchListTile(
                  value: GlobalFilters.isVegetarian,
                  onChanged: (value) {
                    setState(() {
                      GlobalFilters.isVegetarian = value;
                    });
                  },
                  title: Text('Vegetarian'),
                  subtitle: Text('Include vegetarian meals.'),
                ),
                SwitchListTile(
                  value: GlobalFilters.isLactoseFree,
                  onChanged: (value) {
                    setState(() {
                      GlobalFilters.isLactoseFree = value;
                    });
                  },
                  title: Text('Lactose Free'),
                  subtitle: Text('Include lactose free meals.'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
