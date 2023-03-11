import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  const FavoriteScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('You have no favorites yet !')),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          var title = _favoriteMeals[index].title;
          var imageUrl = _favoriteMeals[index].imageUrl;
          var duration = _favoriteMeals[index].duration;
          var complexity = _favoriteMeals[index].complexity;
          var affordability = _favoriteMeals[index].affordability;
          var id = _favoriteMeals[index].id;
          return MealItem(
            title: title,
            imageUrl: imageUrl,
            duration: duration,
            complexity: complexity,
            affordability: affordability,
            id: id,
          );
        },
        itemCount: _favoriteMeals.length,
      );
    }
  }
}
