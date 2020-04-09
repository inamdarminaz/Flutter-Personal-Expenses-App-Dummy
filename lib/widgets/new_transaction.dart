import 'package:flutter/material.dart';
//import './user_transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void dataSubmitted() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      print("No valid Input");
      return;
    }
    widget.addTx(
      titleController.text,
      double.parse(amountController.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
               style: Theme.of(context).textTheme.title,
              //onChanged: (value) => titleInput = value,
              controller: titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => dataSubmitted(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              style: Theme.of(context).textTheme.title,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => dataSubmitted(),
              //onChanged: (value) => amountInput = value,
            ),
            RaisedButton(
            
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(
                  color: Colors.amberAccent[400],
                  
                ),
              ),
              color: Colors.yellow[300],
              child: Text(
                "Add Transaction",
                style: Theme.of(context).textTheme.title,
              ),
              onPressed: dataSubmitted,
            ),
          ],
        ),
      ),
    );
  }
}
