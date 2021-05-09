import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty)
      return Center(
        child: Container(
          child: Text('NO favorites Meal'),
        ),
      );
    else
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals.elementAt(index).id,
            title: favoriteMeals.elementAt(index).title,
            imageUrl: favoriteMeals.elementAt(index).imageUrl,
            duration: favoriteMeals.elementAt(index).duration,
            affordability: favoriteMeals.elementAt(index).affordability,
            complexity: favoriteMeals.elementAt(index).complexity,
          );
        },
        itemCount: favoriteMeals.length,
      );
  }
}
