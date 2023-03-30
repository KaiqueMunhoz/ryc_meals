import 'package:flutter/material.dart';
import 'package:ryc_meals/components/meal_item.dart';
import 'package:ryc_meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Meal _meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(_meal.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              _meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Ingredientes',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            width: 200,
            height: 300,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: _meal.ingredients.length,
              itemBuilder: (_, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(_meal.ingredients[index]),
                  ),
                  color: Theme.of(context).accentColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
