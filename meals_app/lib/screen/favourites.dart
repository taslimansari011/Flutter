import 'package:flutter/material.dart';
import 'package:meals_app/model/global_filters.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../model/meal.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Meal> meals = GlobalData.favouriteMeals;

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: meals.isEmpty
          ? Center(
              child: Text(
                  'You have no favourite meals yet. Please add some meals.'),
            )
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return MealItem(
                  meal: meals[index],
                  updateFavourites: () {
                    setState(() {
                      meals = GlobalData.favouriteMeals;
                    });
                  },
                );
              },
            ),
    );
  }
}
