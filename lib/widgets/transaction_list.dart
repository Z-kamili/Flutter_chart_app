import 'package:first_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList(this.transaction,this.deleteTx);


  @override
  Widget build(BuildContext context) {
    
   print('build() TransactionList');
   return  transaction.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height : 200,
                    child  : Image.asset(
                      'assets/image/waiting.png',
                      fit  : BoxFit.cover,
                    )
              ),
          ],
        )
          : 
          ListView(
            children: transaction
                .map((tx) => TransactionItem
                (
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                ))
                .toList(),
          );
          
      //     ListView.builder(
      //         itemBuilder: (ctx, index) {
      //           return TransactionItem(
      //             transaction: transaction[index], 
      //             deleteTx: deleteTx
      //         );
      //     },
      //         itemCount: transaction.length,
      // );

  }


}