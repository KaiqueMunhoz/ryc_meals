import 'package:flutter/material.dart';
import 'package:ryc_meals/screens/categories_screen.dart';
import 'package:ryc_meals/screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos Cozinhar?'),
      ),
      body: Center(),
    );
  }
}
