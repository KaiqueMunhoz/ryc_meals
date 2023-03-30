import 'package:flutter/material.dart';
import 'package:ryc_meals/components/meal_item.dart';
import 'package:ryc_meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Refeição'),
      ),
      body: Center(
        child: Text('Detalhes da Refeição'),
      ),
    );
  }
}
