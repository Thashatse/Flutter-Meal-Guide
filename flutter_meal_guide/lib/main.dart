import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_meal_guied/data/dummy_data.dart';

import 'models/meals.dart';

import './Screens/tabs_screen.dart';
import './Screens/category_meals_screen.dart';
import './Screens/meal_detail_screen.dart';
import './Screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _favoriteMeals = [];
  List<Meal> _avalibleMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avalibleMeals = DUMMY_MEALS.where((meal) {
        if ((_filters['gluten'] as bool && !meal.isGlutenFree) ||
            (_filters['lactose'] as bool && !meal.isLactoseFree) ||
            (_filters['vegan'] as bool && !meal.isVegan) ||
            (_filters['vegetarian'] as bool && !meal.isVegetarian)) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealID) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealID);

    setState(() {
      if (existingIndex >= 0) {
        _favoriteMeals.removeAt(existingIndex);
      } else {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      }
    });
  }

  bool _isFavorite(String mealID) {
    return _favoriteMeals.any((element) => element.id == mealID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.deepOrangeAccent,
          canvasColor: Colors.white,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyLarge: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyMedium: TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodySmall: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                titleLarge: TextStyle(
                  fontFamily: 'RobotoCondesed',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
                titleMedium: TextStyle(
                  fontFamily: 'RobotoCondesed',
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
                titleSmall: TextStyle(
                  fontFamily: 'RobotoCondesed',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              )),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        CategoriesMealsScreen.routeName: (context) =>
            CategoriesMealsScreen(_avalibleMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
              toggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        FiltersScreen.routeName: (context) => FiltersScreen(
              currentFilters: _filters,
              saveFilters: _setFilters,
            ),
      },
      //onGenerateRoute: (settings) {
      //  return MaterialPageRoute(
      //    builder: (ctx) => CategoriesScreen(),
      //  );
      //},
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => TabsScreen(
            favoriteMeals: _favoriteMeals,
          ),
        );
      },
    );
  }
}
