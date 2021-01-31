import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amtController = TextEditingController();

  void submitData() {
  
    final enteredTitle=titleController.text;
    final enteredAmt=double.parse(amtController.text);
  
    if(enteredTitle.isEmpty || enteredAmt<=0)
    return;


    widget.addTx(
      enteredTitle,
      enteredAmt,
      // titleController.text,
      // double.parse(amtController.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData,
              // onChanged: (value) => textInput=value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amtInput=val,
              controller: amtController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              onPressed: submitData,
              // () {
              //   submitData();
              //   // print(textInput);
              // },
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.orange,
                  // backgroundColor: Colors.purple
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
