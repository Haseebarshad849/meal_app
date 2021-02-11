import 'package:flutter/material.dart';
import 'package:meal_app_like_foodpanda/screens/tabScreenView.dart';
import './screens/categoryMeals.dart';
import './screens/mealsDetailScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
                  fontSize: 18.0

                ),
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
          '/': (ctx) => TabScreenView(),
          '/category-meals': (ctx) => CategoryMeals(),
          '/meal-detail': (ctx) => MealDetailScreen(),
        });
  }
}
