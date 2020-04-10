import 'package:flutter/material.dart';
import 'package:flutter_expenseapp/models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.fill),
                ),
                Text(
                  "No Transaction added yet!",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Clicker',
                    color: Colors.grey[600],
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.title),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteTx(transactions[index].id)),
                  ),
                );
              },

              itemCount: transactions.length,
              // children: transactions.map((tx) {
              //   return
              // }).toList(),
            ),
    );
  }
}
