import 'package:expensess_appp/models/transaction.dart';
import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
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

  void _addNewTransaction(String title, double amt) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amt: amt,
      date: DateTime.now(),
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
