import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_deatails_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {
        required this.id,
        required this.title,
        required this.imageUrl,
        required this.duration,
        required this.complexity,
        required this.affordability,
      });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default :
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default :
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDeatailScreen.routNamed,
      arguments: id,
    ).then((result) {
      if(result != null){
        //removeItem(result);
      }
    });
  }

  Widget buildRowIconAndText (IconData icon, String text){
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 6,),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),

      // The Card that contain the stacked image and text and icons
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [

            // The stack that hold image and the title of meal
            Stack(
              children: [

                // ClipRRect that have an image and some borderRadius from top
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // Positioned Container that contain the title of the meal
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                ),

              ],
            ),

            // Padding Row under the stack which contain some rows of icons and text
            Padding(
              padding: EdgeInsets.all(20),

              // The Big Row of Card that founded under the image
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  // Row that contain the schedule icon and duration time
                  buildRowIconAndText(Icons.schedule, '$duration min'),

                  // Row that contain the work icon and complexityText (Simple,Challenged, Hard)
                  buildRowIconAndText(Icons.work, complexityText),

                  // Row that contain the money icon and affordableText (Affordable, Pricey, Expensive)
                  buildRowIconAndText(Icons.attach_money, affordabilityText),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
