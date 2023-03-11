import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  final Function(Map<String, bool>) setFilters;
  final Map<String, bool> filters;

  const SettingsScreen({required this.setFilters, required this.filters});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isGlutenFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactose = false;

  @override
  void initState() {
    _isGlutenFree = widget.filters['gluten'] as bool;
    _isVegetarian = widget.filters['vegetarian'] as bool;
    _isVegan = widget.filters['vegan'] as bool;
    _isLactose = widget.filters['lactose'] as bool;
    super.initState();
  }

  Widget _buildListTile(String title, String description, bool currentValue,
      Function(bool value) updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactose,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.setFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Adjust your meal selection.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildListTile('Gluten-free', 'Only include gluten-free meals',
                    _isGlutenFree, (value) {
                  setState(() {
                    _isGlutenFree = value;
                  });
                }),
                const Divider(),
                _buildListTile('Lactose-free',
                    'Only include lactose-free meals', _isLactose, (value) {
                  setState(() {
                    _isLactose = value;
                  });
                }),
                const Divider(),
                _buildListTile('Vegetarian', 'Only include vegetarian meals',
                    _isVegetarian, (value) {
                  setState(() {
                    _isVegetarian = value;
                  });
                }),
                const Divider(),
                _buildListTile('Vegan', 'Only include vegan meals', _isVegan,
                    (value) {
                  setState(() {
                    _isVegan = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
