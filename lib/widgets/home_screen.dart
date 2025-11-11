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
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 8)));
    }).toList();
  }

  removeTransaction(String id) {
    setState(() {
      return transaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void userAddList(String txTitle, double txAmount, DateTime selectedDate) {
    final userAdd = Transaction(
      amount: txAmount,
      date: selectedDate,
      id: selectedDate.toString(),
      item: txTitle,
    );

    setState(() {
      transaction.add(userAdd);
    });
    Navigator.of(context).pop();
  }

  addNewTransactionButton(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return FillForm(userAddList);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => addNewTransactionButton(context),
        ),
      ],
      title: Text('My Expense App'),
      foregroundColor: Theme.of(context).shadowColor,
      backgroundColor: Theme.of(context).primaryColor,
    );
    // print(amount);
    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height:
                (MediaQuery.of(context).size.height * 0.33 -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top),
            child: Chart(recentTransaction),
          ),
          SizedBox(
            height:
                (MediaQuery.of(context).size.height * 0.67 -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top),
            child: HomeList(
              transaction: transaction,
              deleteCard: removeTransaction,
            ),
          ),
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
