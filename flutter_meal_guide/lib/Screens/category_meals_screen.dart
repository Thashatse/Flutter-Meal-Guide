import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meals.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/categorie-meals';

  final List<Meal> avalableMeals;

  CategoriesMealsScreen(this.avalableMeals);

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String? categoryId;
  String? title;
  List<Meal>? categoryMeals;
  bool loadedInitData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (!loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryId = routeArgs['id']!;
      title = routeArgs['title']!;
      categoryMeals = widget.avalableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      loadedInitData = true;
    }
  }

//  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: categoryMeals!.length == 0
            ? Center(
                child: Text('No Meals'),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  var meal = categoryMeals![index];
                  return MealItem(
                    id: meal.id,
                    title: meal.title,
                    imageURL: meal.imageUrl,
                    duration: meal.duration,
                    complexity: meal.ComplexityText,
                    affordability: meal.AffordabilityText,
                  );
                },
                itemCount: categoryMeals!.length,
              ));
  }
}
