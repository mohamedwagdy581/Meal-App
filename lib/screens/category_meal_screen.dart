import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routName = '/category-meals';

  final List<Meal> avilableMeals;

  CategoryMealScreen(this.avilableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  var _loadedInitData = false;
  String? categoryTitle;
  late List<Meal> displayedMeals;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
   if (!_loadedInitData){
     final routArgs =
     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
     final categoryId = routArgs['id'];
     categoryTitle = routArgs['title'];
     displayedMeals = widget.avilableMeals
         .where(
           (meal) => meal.categories.contains(categoryId),
     )
         .toList();
     _loadedInitData = true;
   }
    super.didChangeDependencies();
  }
  void _removeMeal (String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
      ),
    );
  }
}
