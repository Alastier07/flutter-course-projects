import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //String titleInput;
  //String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      //onChanged: (val) => titleInput = val,
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      //onChanged: (val) => amountInput = val,
                      controller: amountController,
                    ),
                    FlatButton(
                      onPressed: () {
                        print(titleController.text);
                        print(amountController.text);
                      },
                      child: Text('Add Transaction'),
                      textColor: Colors.purple,
                    )
                  ],
                ),
              ),
            ),
            TransactionList()
          ],
        ));
  }
}
