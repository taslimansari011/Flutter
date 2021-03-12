import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/meal_detail.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function deleteItem;
  Function updateFavourites = () {};
  MealItem({@required this.meal, this.deleteItem, this.updateFavourites});

  String get complexityText {
    if (meal.complexity == Complexity.Simple) {
      return 'Simple';
    } else if (meal.complexity == Complexity.Hard) {
      return 'Hard';
    } else {
      return 'Challenging';
    }
  }

  String get affordabilityText {
    if (meal.affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (meal.affordability == Affordability.Luxurious) {
      return 'Luxurious';
    } else {
      return 'Pricey';
    }
  }

  pushToMealDetails(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetail.routeName, arguments: meal)
        // Then will be called when this pushed page is popped.
        .then((value) {
      if (value != null) {
        deleteItem(value);
      } else {
        if (updateFavourites != null) {
          updateFavourites();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final Meal meal = ModalRoute.of(context).settings.arguments as Meal;
    return InkWell(
      onTap: () => pushToMealDetails(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image(
                    image: NetworkImage(meal.imageUrl),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  // left: 10,
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    padding: EdgeInsets.all(10),
                    color: Colors.black38,
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
              // alignment: Alignment.bottomRight,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 10,
                      ),
                      Text('${meal.duration} min')
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 10,
                      ),
                      Text('${complexityText}')
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 10,
                      ),
                      Text('${affordabilityText}')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
