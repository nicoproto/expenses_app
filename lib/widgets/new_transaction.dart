import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  // String titleInput = '';
  // String amountInput = '';
  final Function _addNewTransaction;

  NewTransaction(this._addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget._addNewTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: titleController,
                  onSubmitted: (_) => submitData(),
                  // onChanged: (value) => titleInput = value,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  // onChanged: (value) => amountInput = value,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: amountController,
                  onSubmitted: (_) => submitData(),
                ),
                TextButton(
                  onPressed: submitData,
                  child: Text('Add transaction'),
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                )
              ])),
    );
  }
}
