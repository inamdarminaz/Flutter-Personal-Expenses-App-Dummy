import 'package:flutter/material.dart';
import 'package:flutter_expenseapp/models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text("No Transaction added yet!",
                    style: Theme.of(context).textTheme.title),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.fill)),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  //card within a column

                  child: Row(
                    // row within a card
                    children: <Widget>[
                      Container(
                        //container within the row
                        margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15), //margin within a container
                        padding:
                            EdgeInsets.all(15), // padding within a container
                        decoration: BoxDecoration(
                            //decoration within a container
                            border: Border.all(
                                color: Theme.of(context).primaryColorDark,
                                width: 2,
                                style: BorderStyle.solid)),
                        child: Text(
                          // amount text
                          // tx.amount.toString(),
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            // fontSize: 20,
                            // fontStyle: FontStyle.italic,

                            // backgroundColor: Theme.of(context).primaryColorDark,
                          ),
                        ),
                      ),
                      Column(
                        // column within the row
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            //title text
                            //tx.title,
                            '${transactions[index].title}',
                            style: Theme.of(context)
                                .textTheme
                                .title, //using textTheme
                          ),
                          Text(
                            //text for date
                            DateFormat.yMMMMd().format(
                                transactions[index].date), // using intl package
                            //'${tx.date}',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
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
