import 'package:flutter/material.dart';
import 'package:ryc_meals/components/meal_item.dart';
import 'package:ryc_meals/data/dummy_data.dart';
import 'package:ryc_meals/models/category.dart';
import 'package:ryc_meals/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (_, index) {
          final Meal _meal = categoryMeals[index];
          return MealItem(_meal);
        },
      ),
    );
  }
}
