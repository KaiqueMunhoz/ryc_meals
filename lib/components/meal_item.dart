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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
