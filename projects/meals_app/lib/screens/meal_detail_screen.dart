import 'package:flutter/material.dart';

class MeaLDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('The meal-$mealId'),
      ),
    );
  }
}
