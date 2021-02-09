import 'package:flutter/material.dart';
import 'package:meal_app_like_foodpanda/models/dummyCategories.dart';
import 'package:meal_app_like_foodpanda/shared_Code/mealItems.dart';

class CategoryMeals extends StatelessWidget {
  // final String id;
  // final String title;
  //
  // CategoryMeals({this.id, this.title});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItems(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            affordability: categoryMeal[index].affordability,
            complexity: categoryMeal[index].complexity,
            duration: categoryMeal[index].duration,
            imageUrl: categoryMeal[index].imageUrl,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
