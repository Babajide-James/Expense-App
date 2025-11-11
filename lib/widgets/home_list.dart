import 'package:flutter/material.dart';
import 'package:for_expense/models/model.dart';
import 'package:intl/intl.dart';
// import './home_screen.dart';

class HomeList extends StatefulWidget {
  const HomeList({
    super.key,
    required this.deleteCard,
    required this.transaction,
  });

  final Function deleteCard;
  final List<Transaction> transaction;
  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  // _HomeListState({required this.deleteCard});

  @override
  Widget build(BuildContext context) {
    return widget.transaction.isEmpty
        ? Column(
            children: [
              Text(
                'Purchase and Expense Lists are Empty!',
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 250,
                child: Image.asset(
                  'assets/image/waiting.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: widget.transaction.length,
            itemBuilder: (ctx, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    child: FittedBox(
                      child: Text('\$${widget.transaction[index].amount}'),
                    ),
                  ),
                  title: Text(
                    widget.transaction[index].item,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMEd().format(widget.transaction[index].date),
                  ),
                  trailing: TextButton(
                    onPressed: () =>
                        widget.deleteCard(widget.transaction[index].id),
                    child: Icon(Icons.delete, color: Colors.red),
                  ),
                ),
              );
            },
          );
  }
}
