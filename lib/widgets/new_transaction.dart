import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate;

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  void dataSubmitted() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0|| selectedDate ==null) {
      print("No valid Input");
      return;
    }
    widget.addTx(
      titleController.text,
      double.parse(amountController.text),
      selectedDate,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
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
            Container(
              height: 40,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? 'No date picked'
                          : 'Picked Date : '
                              '${DateFormat.yMMMMd().format(selectedDate)}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Select a date',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(
                  color: const Color(0xffb3cef7),
                ),
              ),
              color: const Color(0xffb3cef7),
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
