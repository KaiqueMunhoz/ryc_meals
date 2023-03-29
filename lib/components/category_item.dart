import 'package:flutter/material.dart';
import 'package:ryc_meals/models/category.dart';
import 'package:ryc_meals/screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(
    this.category, {
    Key key,
  }) : super(key: key);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed('/categories-meals');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
