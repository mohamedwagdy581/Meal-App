import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDeatailScreen extends StatelessWidget {
  static const routNamed = '/meal_detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDeatailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget containerDecoration(Widget child) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      // List of Ingredients of meal
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container that contain the image of the meal
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // Container of Ingredient Text that where find under the image
            buildSectionTitle(context, 'Ingredients'),

            // Container that contain the List of ingredients of meal
            containerDecoration(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
              ),
            ),

            // Container of Steps Text that where find under the list of Ingredients
            buildSectionTitle(context, 'Steps'),
            // Container that contain the steps of preparing meal
            containerDecoration(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(
                      thickness: 2,
                      height: 4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // The Floating Action Button to Add Meal item to Favorite screen
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: ()=> toggleFavorite(mealId),
      ),
    );
  }
}
