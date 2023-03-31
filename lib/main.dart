import 'package:flutter/material.dart';
import 'package:ryc_meals/data/dummy_data.dart';
import 'package:ryc_meals/models/meal.dart';
import 'package:ryc_meals/models/settings.dart';
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

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = DUMMY_MEALS.where((Meal meal) {
        final _isAMealWithoutGluten =
            settings.isGlutenFree && !meal.isGlutenFree;
        final _isAMealWithoutLactose =
            settings.isLactoseFree && !meal.isLactoseFree;
        final _isNotAMealVegan = settings.isVegan && !meal.isVegan;
        final _isNotAMealVegetarian =
            settings.isVegetarian && !meal.isVegetarian;

        return !_isAMealWithoutGluten &&
            !_isAMealWithoutLactose &&
            !_isNotAMealVegan &&
            !_isNotAMealVegetarian;
      }).toList();
    });
  }

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
        AppRoutes.CATEGORIES_MEALS: (_) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (_) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (_) => SettingsScreen(_filterMeals),
      },
    );
  }
}
