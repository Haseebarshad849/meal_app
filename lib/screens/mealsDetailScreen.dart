import 'package:flutter/material.dart';
import '../models/dummyCategories.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical:20.0,horizontal: 40),
            child: Container(
              color: Colors.black54,
              // width: MediaQuery.of(context).size.width*0.7,
              height: 200,
            ),
          )

        ],
      ),
    );
  }
}
