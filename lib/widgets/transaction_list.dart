import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  'No transactions added yet!',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Opacity(
                      opacity: 0.2,
                      child: Image.asset('assets/images/waiting.png')),
                  height: 200,
                  alignment: Alignment.center,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 30,
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.black,
                          radius: 27,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                              child: Text('\$${transactions[index].amount}'),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      subtitle: Text(
                          DateFormat.yMMMMd().format(transactions[index].date)),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
