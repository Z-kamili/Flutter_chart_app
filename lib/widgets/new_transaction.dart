import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

   final titleController = TextEditingController();
   final amountController = TextEditingController();

   @override 
   Widget build(BuildContext context) 
   {
        return     
            Card(
              elevation: 5,
              child:Container(
                padding: EdgeInsets.all(10),
                child:Column(
                  children: <Widget>[
                       TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: titleController,
                       ),
                       TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        controller: amountController,
                       ),
                       ElevatedButton(
                        child:Text('Add Transaction'),
                        style: ElevatedButton.styleFrom(
                             // ignore: deprecated_member_use
                             primary: Colors.purple,
                        ),
                        onPressed: () {
                           print(titleController.text);
                        },
                        )
                    ],
                  ),
              )
          );
   }


}