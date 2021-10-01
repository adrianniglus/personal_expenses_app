import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_item.dart';
import 'package:flutter_complete_guide/widgets/transaction_placeholder.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  const TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? const TransactionPlaceholder()
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(transactions[index], _deleteTransaction);
            },
            itemCount: transactions.length,
          );
  }
}
