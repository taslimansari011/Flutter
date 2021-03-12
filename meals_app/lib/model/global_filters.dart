import 'package:meals_app/model/meal.dart';

class GlobalFilters {
  static bool isGlutenFree = false;
  static bool isVegan = false;
  static bool isVegetarian = false;
  static bool isLactoseFree = false;
}

class GlobalData {
  static List<Meal> favouriteMeals = [];
}
