import 'package:flutter/material.dart';
import 'package:ryc_meals/components/main_drawer.dart';
import 'package:ryc_meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings settings) onSettingsChanged;

  const SettingsScreen(
    this.settings,
    this.onSettingsChanged, {
    Key key,
  }) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch({
    @required String title,
    @required String subtitle,
    @required bool value,
    @required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (bool _hasValue) {
        onChanged(_hasValue);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  title: 'Sem Glúten',
                  subtitle: 'Só exibe refeições sem glúten',
                  value: settings.isGlutenFree,
                  onChanged: (bool _isGlutenFree) {
                    setState(
                      () {
                        settings.isGlutenFree = _isGlutenFree;
                      },
                    );
                  },
                ),
                _createSwitch(
                  title: 'Sem Lactose',
                  subtitle: 'Só exibe refeições sem lactose',
                  value: settings.isLactoseFree,
                  onChanged: (bool _isLactoseFree) {
                    setState(
                      () {
                        settings.isLactoseFree = _isLactoseFree;
                      },
                    );
                  },
                ),
                _createSwitch(
                  title: 'Vegana',
                  subtitle: 'Só exibe refeições veganas!',
                  value: settings.isVegan,
                  onChanged: (bool _isVegan) {
                    setState(
                      () {
                        settings.isVegan = _isVegan;
                      },
                    );
                  },
                ),
                _createSwitch(
                  title: 'Vegetariana',
                  subtitle: 'Só exibe refeições vegetarianas!',
                  value: settings.isVegetarian,
                  onChanged: (bool _isVegetarian) {
                    setState(
                      () {
                        settings.isVegetarian = _isVegetarian;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
