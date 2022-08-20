import 'package:flutter/material.dart';

import '../Screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String catID;
  final String title;
  final Color color;

  CategoryItem(this.catID, this.title, this.color);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoriesMealsScreen.routeName,
      arguments: {
        'id': catID,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
