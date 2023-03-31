import 'package:flutter/material.dart';
import 'package:ryc_meals/data/dummy_data.dart';
import 'package:ryc_meals/models/meal.dart';
import 'package:ryc_meals/screens/categories_meals_screen.dart';
import 'package:ryc_meals/screens/meal_detail_screen.dart';
import 'package:ryc_meals/screens/settings_screen.dart';
import 'package:ryc_meals/screens/tabs_screen.dart';
import 'package:ryc_meals/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6:
                  TextStyle(fontSize: 20.0, fontFamily: 'RobotoCondensed'),
            ),
      ),
      routes: {
        AppRoutes.HOME: (_) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (_) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (_) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (_) => const SettingsScreen(),
      },
    );
  }
}
