import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  // Submit data function
  void _submitData() {
    // Check if amount is empty
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    // Check if data is empty
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    // Close modal
    Navigator.of(context).pop();
  }

  // DatePicker function for showing and selecting date
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate, // DateTime.now()
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        //return;
        return (_selectedDate);
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              // Input for title
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                //onChanged: (val) => titleInput = val,
                controller: _titleController,
                //onSubmitted: (_) => _submitData(),
              ),
              // Input for amount
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                //onChanged: (val) => amountInput = val,
                controller: _amountController,
                keyboardType: TextInputType.number,
                //onSubmitted: (_) => _submitData(),
              ),
              // DatePicker Text & Button
              SizedBox(
                height: 70,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      //_selectedDate == null
                      //? 'No Date Chosen!'
                      //? 'Picked Date: ${DateFormat.yMd().format(DateTime.now())}'
                      //:
                      'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ]),
              ),
              // Submit Button for adding transaction
              ElevatedButton(
                onPressed: _submitData,
                child: const Text('Add Transaction'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
