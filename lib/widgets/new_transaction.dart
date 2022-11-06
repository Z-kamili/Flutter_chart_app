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
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();

  }

  void _presentDatePicker()
  {
    showDatePicker(context: context,
    initialDate:DateTime.now(),
    firstDate: DateTime(2019),
    lastDate: DateTime.now(),
    ).then((value)  {
       if (value == null) {
        return ;
       } 
       setState(() {
        _selectedDate = value;
       });
    });
    print('...');
  }

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
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
           Container(
            height: 70,
           child :  Row(
              children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                ElevatedButton(
                  child:Text('Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                  ),
                  onPressed: () {
                      _presentDatePicker();
                  },
          )
              ],
             ),
        ),
        ElevatedButton(
              child:Text('Add Transaction'),
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: Colors.purple,
              ),
              onPressed: _submitData,
          )
          ],
        ),
      ),
    );
  }
}
