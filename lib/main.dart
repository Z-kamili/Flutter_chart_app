import 'package:first_app/models/transaction.dart';
import 'package:first_app/widgets/new_transaction.dart';
import 'package:first_app/widgets/transaction_list.dart';
import './widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try.
        // changing the primarySwatch below to Colors.green and then invoke.
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application.
        // is not restarted.
        primarySwatch: Colors.blue,
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

   final List<Transaction> transaction =  [

    Transaction(
      id: 't1', 
      title: 'New Shoes', 
      amount: 69.99,
      date:DateTime.now()
    ),
    Transaction(
      id: 't2', 
      title: 'Weekly Groceries', 
      amount: 78.99,
      date:DateTime.now()
      ),
  ];


  final titleController = TextEditingController();
  final amountController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions : <Widget> [
            IconButton(icon: Icon(Icons.add),
            onPressed: () {

            },
            ),
        ],
      ),
      body: 
      SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
            Container(
                width: double.infinity,
                child: Card(
                  color : Colors.blue,
                  child : Text('CHART!'),
                  elevation : 5,
               ),
            ),
           UserTransaction()
        ],
    ),
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  floatingActionButton: FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () {
        
    },
  ),

  );
}
}
