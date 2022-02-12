import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categyId;
  final String categoryTitle;

  CategoryMealsScreen(this.categyId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: Center(
        child: Text(
          'The recipes for the category!',
        ),
      ),
    );
  }
}
