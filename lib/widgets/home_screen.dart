import 'package:flutter/material.dart';
import '../models/model.dart';
import './fill_form.dart';
import '../chart/chart.dart';
import './home_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      amount: 200,
      date: DateTime.now(),
      item: 'Expensive Shoes',
    ),
    Transaction(
      id: 't2',
      amount: 555,
      date: DateTime.now(),
      item: 'Mac Book m2',
    ),
    Transaction(
      id: 't3',
      amount: 5000,
      date: DateTime.now(),
      item: 'Expensive House',
    ),
  ];
  List<Transaction> get recentTransaction {
    return transaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void userAddList(String txTitle, double txAmount) {
    final userAdd = Transaction(
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      item: txTitle,
    );

    setState(() {
      transaction.add(userAdd);
    });
  }

  void addNewTransactionButton(BuildContext contxt) {
    showModalBottomSheet(
      context: contxt,
      builder: (_) {
        return FillForm(userAddList);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => addNewTransactionButton(context),
          ),
        ],
        title: Text('Purchase Record App'),
        foregroundColor: Theme.of(context).primaryColorDark,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Chart(recentTransaction),
          HomePage(transaction: transaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewTransactionButton(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
