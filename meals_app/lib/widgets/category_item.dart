import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/model/category.dart';
import '../screen/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem(this.category);

  pushToDetails(BuildContext context) {
    // Navigator.push(
    //   context,
    //   Platform.isIOS
    //       ? CupertinoPageRoute(builder: (_) {
    //           return CategoryMeals(
    //             category: category,
    //           );
    //         })
    //       : MaterialPageRoute(
    //           builder: (_) {
    //             return CategoryMeals(
    //               category: category,
    //             );
    //           },
    //         ),
    // );
    Navigator.pushNamed(context, CategoryMeals.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: category.color,
      borderRadius: BorderRadius.circular(15),
      onTap: () => pushToDetails(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.7), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
