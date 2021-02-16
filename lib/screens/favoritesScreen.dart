import 'package:flutter/material.dart';
import '../shared_Code/mealItems.dart';
import '../models/meal.dart';

class FavortiesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const FavortiesScreen(this.favoriteMeals);

  @override
  _FavortiesScreenState createState() => _FavortiesScreenState();
}

class _FavortiesScreenState extends State<FavortiesScreen> {
  @override
  void initState() {
    widget.favoriteMeals.length;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItems(
            id: widget.favoriteMeals[index].id,
            title: widget.favoriteMeals[index].title,
            affordability: widget.favoriteMeals[index].affordability,
            complexity: widget.favoriteMeals[index].complexity,
            duration: widget.favoriteMeals[index].duration,
            imageUrl: widget.favoriteMeals[index].imageUrl,
          );
        },
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}
