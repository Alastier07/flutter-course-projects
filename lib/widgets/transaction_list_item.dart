import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    required this.transactions,
    required this.deleteTx,
    super.key,
  });

  final Transaction transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '₱${transactions.amount.toStringAsFixed(2)}', // Amount
              ),
            ),
          ),
        ),
        title: Text(
          transactions.title, // Title
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transactions.date), // Date
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () => deleteTx(transactions.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () => deleteTx(transactions.id),
              ), // Delete Button
      ),
    );
  }
}
