import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';

import 'package:meals/widget/meal_item.dart';
//import './dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/Category-meals';

  List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var categoryTitle;

  List<Meal> displayMeals = [];
  var loadingInitData = false;

  void _removeMeal(String mealid) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealid);
    });
  }

  @override
  void didChangeDependencies() {
    if (!loadingInitData) {
      final routArge =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      final categoryID = routArge['id'];
      categoryTitle = routArge['title'];
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryID);
      }).toList();

      loadingInitData = true;
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeals.elementAt(index).id,
              title: displayMeals.elementAt(index).title,
              imageUrl: displayMeals.elementAt(index).imageUrl,
              duration: displayMeals.elementAt(index).duration,
              affordability: displayMeals.elementAt(index).affordability,
              complexity: displayMeals.elementAt(index).complexity,
              //    removeItem: _removeMeal,
            );
          },
          itemCount: displayMeals.length,
        ),
      ),
    );
  }
}
