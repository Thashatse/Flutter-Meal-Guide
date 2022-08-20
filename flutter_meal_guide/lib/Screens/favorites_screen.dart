import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meals.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: favoriteMeals.isEmpty
            ? Center(
                child: Text('No Meals'),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  var meal = favoriteMeals[index];
                  return MealItem(
                    id: meal.id,
                    title: meal.title,
                    imageURL: meal.imageUrl,
                    duration: meal.duration,
                    complexity: meal.ComplexityText,
                    affordability: meal.AffordabilityText,
                  );
                },
                itemCount: favoriteMeals.length,
              ));
  }
}
