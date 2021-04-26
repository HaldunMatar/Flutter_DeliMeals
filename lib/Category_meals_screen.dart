import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.categoryTitle),
      ),
      body: Center(
        child: Container(
          child: Text(
            'The reciep for category',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
