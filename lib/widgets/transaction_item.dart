import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionItem extends StatefulWidget {

  const TransactionItem({
   required Key key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();


}
class _TransactionItemState extends State<TransactionItem> {


  Color _bgColor = Colors.black;


  @override
  void initState() {

    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    //card 
    return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _bgColor,
                      radius: 30,
                      child: Padding(
                        //const means that the value can't change.
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${widget.transaction.amount}'),
                          // child: Text(index),
                        ),
                      ),
                    ),
                    title: Text(
                      widget.transaction.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(
                        widget.transaction.date
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => widget.deleteTx(widget.transaction.id),
                    ),
                  ),
            );
  }

}