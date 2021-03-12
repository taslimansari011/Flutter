import 'package:flutter/material.dart';
import 'package:meals_app/screen/categories.dart';
import 'package:meals_app/screen/category_meals.dart';
import 'package:meals_app/screen/favourites.dart';
import 'package:meals_app/screen/filters.dart';
import 'package:meals_app/screen/meal_detail.dart';
import 'package:meals_app/screen/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: Categories(),
      initialRoute: '+', // By default it is '/'.
      // We can change it using this key
      routes: {
        // '/': (_) => Categories(),
        '+': (_) => TabScreen(), //Categories(),
        CategoryMeals.routeName: (_) => CategoryMeals(),
        MealDetail.routeName: (_) => MealDetail(),
        Filters.routeName: (_) => Filters(),
      },
      // if we didn't define route for any screen in route table above then
      // onGenerateRoute will be called and Categories() screen will be pushed
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (_) => Categories());
      // },
      // If any page does not exist than this method will be called
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => Categories());
      },
    );
  }
}
