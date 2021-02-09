import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}
enum Affordability {
  Affordable,
  Luxurious,
  Pricey,
}

class Meal {
  final String id;
  final List<String> categories;
  final String imageUrl;
  final String title;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal (
  {@required  this.id,
    @required  this.categories,
    @required  this.imageUrl,
   @required   this.title,
    @required  this.duration,
    @required  this.affordability,
    @required  this.complexity,
    @required  this.ingredients,
    @required  this.steps,
    @required  this.isGlutenFree,
    @required  this.isVegan,
    @required  this.isVegetarian,
    @required  this.isLactoseFree});
}
