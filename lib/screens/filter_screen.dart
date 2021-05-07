import 'package:flutter/material.dart';
import 'package:meals/widget/ma%C4%B1n_drawer.dart';

class Filters extends StatelessWidget {
  static const routeName = 'filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('your filter'),
      ),
      body: Container(
        child: Text('Filters'),
      ),
      drawer: MainDrawer(),
    );
  }
}
