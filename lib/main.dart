import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      id: 'p1',
      title: 'jacket',
      amt: 1500.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'p2',
      title: 'watch',
      amt: 25000.0,
      date: DateTime.now(),
    ),
  ];
  String textInput;
  String amtInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expensess'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart'),
              // elevation: 85,
            ),
          ),
          Card(
            elevation: 10, 
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  onChanged: (value) => textInput=value,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  onChanged: (val) => amtInput=val,
                ),
                FlatButton(
                  onPressed: () {
                    print(textInput);
                  },
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
              )),
          Column(
            children: transaction.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '\₹${tx.amt}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          DateFormat().format(tx.date),
                        ),
                        // Text(tx.date.toString()),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
