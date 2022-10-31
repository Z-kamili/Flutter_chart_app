import 'package:first_app/models/transaction.dart';
import 'package:first_app/widgets/new_transaction.dart';
import 'package:first_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {

   @override 
   _UserTransactionsState createState() => _UserTransactionsState();

}

class _UserTransactionsState extends State<UserTransaction> {

    final List<Transaction> _userTransaction = [

    Transaction(id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Weekly Groceries', amount: 16.53, date: DateTime.now()),

  ];

  void _addNewTransaction(String txTitle,double txamount) {

      final newTx = Transaction(id:'',title: txTitle,amount:txamount,date:DateTime.now());

      setState(() {
        _userTransaction.add(newTx);
      });

  }

  @override 
  Widget build(BuildContext context) {

    return Column(
      
      children : <Widget>[ 
        NewTransaction(),
        TransactionList(_userTransaction)
        ],

    );

  }

}