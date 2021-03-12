import 'package:flutter/material.dart';
import 'package:meals_app/model/global_filters.dart';
import 'package:meals_app/model/meal.dart';

class MealDetail extends StatefulWidget {
  static const routeName = '/meal_detail';

  @override
  _MealDetailState createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  bool isMealFavourite = false;
  Meal meal;

  didChangeDependencies() {
    super.didChangeDependencies();
    meal = ModalRoute.of(context).settings.arguments as Meal;
    isMealFavourite = GlobalData.favouriteMeals.contains(meal);
  }

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavourite ? Icons.star : Icons.star_border),
        onPressed: () {
          setState(() {
            isMealFavourite = !isMealFavourite;
            if (isMealFavourite) {
              GlobalData.favouriteMeals.add(meal);
            } else {
              GlobalData.favouriteMeals.remove(meal);
            }
          });
        },
      ),
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Image
              Container(
                height: 300,
                width: double.infinity,
                child: Image(
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),

              // Text
              buildSectionTitle(context, 'Ingredients'),
              // List
              buildContainer(
                context,
                ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          meal.ingredients[index],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    );
                  },
                ),
              ),

              buildSectionTitle(context, 'Steps'),
              buildContainer(
                context,
                ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// My code
// Ingredient's list item
//   Container(
//   padding: EdgeInsets.all(2),
//   child: Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(5),
//       color: Colors.amber,
//     ),
//     padding: EdgeInsets.all(5),
//     child: Text(meal.ingredients[index]),
//   ),
// );
