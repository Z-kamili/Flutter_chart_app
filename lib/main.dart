import 'package:first_app/models/transaction.dart';
import 'package:first_app/widgets/chart.dart';
import 'package:first_app/widgets/new_transaction.dart';
import 'package:first_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './widgets/transaction_list.dart';


void main() {
  runApp(MaterialApp(home:MyApp()));
}



class MyApp extends StatelessWidget {
  
  // const MyApp({super.key});
  

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
         primarySwatch: Colors.purple,
         errorColor: Colors.red,
         accentColor: Colors.amber,
         fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            // ignore: deprecated_member_use.
            textTheme: ThemeData.light().textTheme.copyWith(
                  titleLarge: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              ),
          )
          //here is where the error resides 

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try.
        // changing the primarySwatch below to Colors.green and then invoke.
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application.
        // is not restarted.
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }


}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();
  final String title;

  const MyHomePage({super.key, required this.title});




  @override
  State<MyHomePage> createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {


  //private
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();

  }

  void _addNewTransaction(String txTitle,double txAmount,DateTime chosenDate) 
  {
    
    final newTx = Transaction(
      title: txTitle, 
      amount: txAmount, 
      date: chosenDate,
      id:DateTime.now().toString(),
  );

    setState(() {
      _userTransactions.add(newTx);
    });

  }


  final titleController = TextEditingController();
  final amountController = TextEditingController();


  void _startAddNewTransaction(BuildContext ctx) {

    showModalBottomSheet(context: ctx,builder: (_) {

            return GestureDetector(
              onTap: () {},
              child:  NewTransaction(_addNewTransaction),
              behavior: HitTestBehavior.opaque,
            );
            
    },

  );

  }

  void _deleteTransaction(String id) 
  {
       setState(() {
         _userTransactions.removeWhere((element) {
          return element.id == id;
         });
       });
  }


  @override
  Widget build(BuildContext context) {

 final isLandscape =   MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions : <Widget>[
             IconButton(
              icon : Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
             ),
        ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          if(isLandscape)  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text('Show Chart'),
              Switch(value: _showChart ,
              onChanged:(val) {
                 setState(() {
                   _showChart = val;
                 });  
              },),
            ],),
          _showChart ?  Container(
              height: (MediaQuery.of(context).size.height - 
              appBar.preferredSize.height - 
              MediaQuery.of(context).padding.top) * 0.3,
              child:  Chart(_recentTransactions),
            ) : Container(
            height: (MediaQuery.of(context).size.height - appBar.preferredSize.height) * 0.7,
            child : TransactionList(_userTransactions , _deleteTransaction),
            ),  
        ],
    ),
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  floatingActionButton: FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () => _startAddNewTransaction(context),
  ),
);
}
}
