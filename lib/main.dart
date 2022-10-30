import 'package:first_app/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  // final List<>;

  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   final List<Transaction> transaction =  [

    Transaction(id: 't1', title: 'New Shoes', amount: 69.99,date:DateTime.now()),
    Transaction(id: 't2', title: 'Weekly Groceries', amount: 78.99,date:DateTime.now())

  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
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
            Card(
              elevation: 5,
              child:Container(
                padding: EdgeInsets.all(10),
                child:Column(
                  children: <Widget>[
                       TextField(),
                       TextField(),
                    ],
                  ),
              )
          ),
           Column(
            children: transaction.map((tx) {
              return Card(
                  child : Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                       vertical: 10,
                       horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border:Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child:Text(
                     'A: ${tx.amount.toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple
                        ),

                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(tx.title,style:TextStyle(fontSize: 18,fontWeight:FontWeight.bold)),
                      Text(
                      DateFormat('yyyy-MM-dd').format(tx.date),
                      style: TextStyle(color: Colors.grey),
                      ),
                    ],)
              ],),
              );
            }).toList(),
           ),
            ],
        ),
    );
  }
}
