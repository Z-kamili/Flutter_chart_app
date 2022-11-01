import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

   final Function addTx;
   final titleController = TextEditingController();
   final amountController = TextEditingController();

   NewTransaction(this.addTx);

   void submitData()
   {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0) 
    {
      return;
    }

    addTx(
      titleController.text,
      double.parse(amountController.text)
    );
    
   }

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
                        onSubmitted: (_) => submitData,
                       ),
                       TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        onSubmitted: (_) => submitData,
                       ),
                       ElevatedButton(
                        child:Text('Add Transaction'),
                        style: ElevatedButton.styleFrom(
                             // ignore: deprecated_member_use
                             primary: Colors.purple,
                        ),
                        onPressed: submitData,
                        )
                    ],
                  ),
              )
          );
   }


}