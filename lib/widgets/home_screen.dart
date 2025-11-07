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
    // Transaction(id: 'Add`', amount: 22, date: DateTime.now(), item: 'Djnjdnd'),
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
    Navigator.of(context).pop();
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
    // print(amount);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => addNewTransactionButton(context),
          ),
        ],
        title: Text('My Expense App'),
        foregroundColor: Theme.of(context).shadowColor,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Chart(recentTransaction)),
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
