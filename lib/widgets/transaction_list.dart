import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraint) {
            return Column(
              children: [
                SizedBox(height: constraint.maxHeight * 0.15),
                Container(
                  height: constraint.maxHeight * 0.1,
                  child: Text(
                    'No transactions added yet!',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: constraint.maxHeight * 0.15),
                Container(
                  child: Opacity(
                      opacity: 0.2,
                      child: Image.asset('assets/images/waiting.png')),
                  height: constraint.maxHeight * 0.6,
                  alignment: Alignment.center,
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                              '\$${transactions[index].amount}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 360
                        ? TextButton.icon(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.grey)),
                            onPressed: () =>
                                _deleteTransaction(transactions[index].id),
                            icon: const Icon(CupertinoIcons.trash),
                            label: Text('Delete'))
                        : IconButton(
                            onPressed: () =>
                                _deleteTransaction(transactions[index].id),
                            icon: const Icon(Icons.delete),
                          ),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
