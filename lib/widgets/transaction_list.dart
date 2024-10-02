import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './transaction_list_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx); //Constructor

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, contraints) {
            return Column(
              // Showing this widget if empty transactions
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                // Image
                Container(
                    height: contraints.maxHeight * 0.8,
                    child: Image.asset(
                      // 'assets/images/empty.png',
                      'assets/images/empty.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView.builder(
            // Show List of Transactions
            itemBuilder: (ctx, index) {
              return TransactionListItem(
                transactions: transactions[index],
                deleteTx: deleteTx,
              );
            },
            itemCount: transactions.length,
          );
  }
}
