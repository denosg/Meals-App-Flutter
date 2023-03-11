import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  const CategoryMeals(this.availableMeals);

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle = '';
  List<Meal> categoryMeals = [];
  var _loadedInitData = false;

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var title = categoryMeals[index].title;
          var imageUrl = categoryMeals[index].imageUrl;
          var duration = categoryMeals[index].duration;
          var complexity = categoryMeals[index].complexity;
          var affordability = categoryMeals[index].affordability;
          var id = categoryMeals[index].id;
          return MealItem(
            title: title,
            imageUrl: imageUrl,
            duration: duration,
            complexity: complexity,
            affordability: affordability,
            id: id,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
