import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meal_dtails_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

import 'models/meal.dart';
import 'screens/categories_screen.dart';
import 'screens/Category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((element) => element.id == mealId);
  }

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['vegeterian'] && !meal.isVegetarian) return false;

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals 1',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'RaleWay',
          textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                subtitle2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline1: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              )),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        Filters.routeName: (ctx) => Filters(_filters, setFilters),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(_isMealFavorite, _toggleFavorite)
      },
      /*onGenerateRoute: (setting) {
        //if (setting.name == )

        return MaterialPageRoute(builder: (ctx) {
          return CategoriesScreen();
        });
      },*/
      /* onUnknownRoute: (setting) {
         return MaterialPageRoute(builder: (ctx) {
          return CategoriesScreen();
        });
      },*/
    );
  }
}
