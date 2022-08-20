import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

import '../models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  final Function(String mealID) toggleFavorite;
  final Function(String mealID) isFavorite;

  MealDetailScreen({
    required this.toggleFavorite,
    required this.isFavorite,
  });

  Widget builSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 250,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)?.settings.arguments as String;
    final Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text('${meal.title}')),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          builSectionTitle(context, 'Ingredients'),
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) {
                var ingredient = meal.ingredients[index];
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(ingredient)),
                );
              },
              itemCount: meal.ingredients.length,
            ),
          ),
          builSectionTitle(context, 'Steps'),
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) {
                var step = meal.steps[index];
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '#${index + 1}',
                          ),
                        ),
                        title: Text(
                          step,
                        ),
                      ),
                      Divider()
                    ],
                  ),
                );
              },
              itemCount: meal.steps.length,
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(meal.id) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          toggleFavorite(meal.id);
        },
      ),
    );
  }
}
