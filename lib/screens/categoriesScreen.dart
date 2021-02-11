import 'package:flutter/material.dart';
import 'package:meal_app_like_foodpanda/models/dummyCategories.dart';
import 'package:meal_app_like_foodpanda/shared_Code/categoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Deals Meal'),
      //   centerTitle: true,
      // ),
      body: GridView(
        padding: const EdgeInsets.all(16.0),
        children:
        DUMMY_CATEGORIES.map((catData) =>
            CategoryItem(catData.id,catData.title, catData.color)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 1.4,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      )),
    );
  }
}
