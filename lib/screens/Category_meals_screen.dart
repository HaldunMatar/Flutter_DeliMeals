import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/widget/meal_item.dart';
//import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/Category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routArge =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryID = routArge['id'];
    final categoryTitle = routArge['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryID);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals.elementAt(index).id,
                title: categoryMeals.elementAt(index).title,
                imageUrl: categoryMeals.elementAt(index).imageUrl,
                duration: categoryMeals.elementAt(index).duration,
                affordability: categoryMeals.elementAt(index).affordability,
                complexity: categoryMeals.elementAt(index).complexity);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
