import 'package:flutter/material.dart';
import 'package:ryc_meals/models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(
    this.meal, {
    Key key,
  }) : super(key: key);

  void _selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _selectMeal,
      child: Card(
        child: Text(meal.title),
      ),
    );
  }
}
