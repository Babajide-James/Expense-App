import 'dart:io';
import 'package:flutter/cupertino.dart';
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

  bool _showChart = false;

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
      // showDragHandle: true,
      builder: (_) {
        return FillForm(userAddList);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ifLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('My Expense App'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                () => addNewTransactionButton(context);
              },
            ),
          )
        : AppBar(
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

    final chartImage = SizedBox(
      height:
          (MediaQuery.of(context).size.height * 0.7 -
          appBar.preferredSize.height -
          MediaQuery.of(context).padding.top),
      child: HomeList(transaction: transaction, deleteCard: removeTransaction),
    );

    final appBody = SafeArea(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (ifLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Switch on to View Chart',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  Icon(Icons.arrow_right_alt),
                  Switch.adaptive(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (!ifLandscape)
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height:
                    (MediaQuery.of(context).size.height * 0.3 -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top),
                child: Chart(recentTransaction),
              ),
            if (!ifLandscape) chartImage,
            if (ifLandscape)
              _showChart
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height:
                          (MediaQuery.of(context).size.height * 0.75 -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top),
                      child: Chart(recentTransaction),
                    )
                  : chartImage,
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(),
            child: appBody,
          )
        : Scaffold(
            appBar: appBar,
            body: appBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => addNewTransactionButton(context),
                    child: Icon(Icons.add),
                  ),
          );
  }
}
