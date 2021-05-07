import 'package:flutter/material.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meal_dtails_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/Category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (ctx) => TabsScreen(),
        Filters.routeName: (ctx) => Filters(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen()
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
