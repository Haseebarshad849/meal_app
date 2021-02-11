import 'package:flutter/material.dart';
import '../models/dummyCategories.dart';

class MealDetailScreen extends StatelessWidget {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Container(
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget buildContainerDecoration(BuildContext context, Widget child) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.blueGrey),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            // Custom Widget for duplicate code
            buildSectionTitle(context, 'Ingredient'),

            // ======== INGREDIENTS FETCHING FROM DUMMY ===========

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              child: buildContainerDecoration(
                context,
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
                    child: Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),

            // ======== STEPS FETCHING FROM DUMMY ===========
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              child: buildContainerDecoration(
                  context,
                  ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                      children: [ ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                      ]
                    ),
                    itemCount: selectedMeal.steps.length,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
