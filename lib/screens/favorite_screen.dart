import 'package:flutter/material.dart';
import 'package:ryc_meals/components/meal_item.dart';
import 'package:ryc_meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'Nenhuma refeição foi marcada como favorita!',
        ),
      );
    }
    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (_, index) {
        return MealItem(favoriteMeals[index]);
      },
    );
  }
}
