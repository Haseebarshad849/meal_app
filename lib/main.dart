import 'package:flutter/material.dart';
import 'package:meal_app_like_foodpanda/models/dummyCategories.dart';
import 'package:meal_app_like_foodpanda/models/meal.dart';
import 'package:meal_app_like_foodpanda/screens/filtersScreen.dart';
import 'package:meal_app_like_foodpanda/screens/tabScreenView.dart';
import './screens/categoryMeals.dart';
import './screens/mealsDetailScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  //========================================
  // TOGGLE FAVORITES ITEM "Creating logic"
  //========================================
  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else
      setState(() {
        _favoriteMeal.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
  }
   bool _isFavorite(String id ){
    return _favoriteMeal.any((meal) => meal.id == id);
   }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.amber,
          primarySwatch: Colors.indigo,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                    color: Color.fromRGBO(20, 51, 52, 1),
                    fontFamily: 'Raleway',
                    fontSize: 18.0),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        // home: CategoriesScreen(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabScreenView(_favoriteMeal),
          CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeal),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
          FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilter),
        });
  }
}
