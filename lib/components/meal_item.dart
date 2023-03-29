import 'package:flutter/material.dart';
import 'package:ryc_meals/models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(
    this.meal, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(meal.title),
    );
  }
}
