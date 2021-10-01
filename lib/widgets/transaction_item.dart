import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  
  const TransactionItem(this.transaction, this._deleteTransaction);

  final Transaction transaction;
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 30,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              radius: 26,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: FittedBox(
                  child: Text(
                    '\$${transaction.amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            transaction.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          subtitle: Text(
            DateFormat.yMMMMd().format(transaction.date),
          ),
          trailing: MediaQuery.of(context).size.width > 360
              ? TextButton.icon(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.grey)),
                  onPressed: () => _deleteTransaction(transaction.id),
                  icon: const Icon(CupertinoIcons.trash),
                  label: const Text('Delete'))
              : IconButton(
                  onPressed: () => _deleteTransaction(transaction.id),
                  icon: const Icon(Icons.delete),
                ),
        ),
      ),
    );
  }
}
