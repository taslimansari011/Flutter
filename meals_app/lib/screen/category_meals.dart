import 'package:flutter/material.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/model/dummy_data.dart';
import 'package:meals_app/model/global_filters.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/categories_meals';

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  Category category;
  List<Meal> meals;

  _removeMeal(Meal meal) {
    meals.remove(meal);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    category = ModalRoute.of(context).settings.arguments as Category;
    meals = DUMMY_MEALS.where((meal) {
      if (meal.categories.contains(category.id)) {
        if (GlobalFilters.isGlutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (GlobalFilters.isVegan && !meal.isVegan) {
          return false;
        }
        if (GlobalFilters.isVegetarian && !meal.isVegetarian) {
          return false;
        }
        if (GlobalFilters.isLactoseFree && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }
      return false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                meal: meals[index],
                deleteItem: (meal) {
                  setState(() {
                    _removeMeal(meal);
                  });
                },
              );
            }),
      ),
    );
  }
}
