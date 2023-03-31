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
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((Meal meal) {
        final _isAMealWithGluten =
            !(settings.isGlutenFree && !meal.isGlutenFree);
        final _isAMealWithLactose =
            !(settings.isLactoseFree && !meal.isLactoseFree);
        final _isAVeganMeal = !(settings.isVegan && !meal.isVegan);
        final _isAVegetarianMeal =
            !(settings.isVegetarian && !meal.isVegetarian);

        return _isAMealWithGluten &&
            _isAMealWithLactose &&
            _isAVeganMeal &&
            _isAVegetarianMeal;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
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
        AppRoutes.HOME: (_) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (_) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (_) => MealDetailScreen(_toggleFavorite),
        AppRoutes.SETTINGS: (_) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
}
