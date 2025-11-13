import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/model.dart';
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
        ? LayoutBuilder(
            builder: (contxt, constraint) {
              return Column(
                children: [
                  SizedBox(height: constraint.maxHeight * 0.03),
                  Text(
                    'Expense List is Empty!',
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: constraint.maxHeight * 0.03),
                  SizedBox(
                    height: constraint.maxHeight * 0.8,
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
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
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          onPressed: widget.deleteCard(
                            widget.transaction[index].id,
                            Icon(Icons.delete, color: Colors.red),
                          ),

                          label: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      : TextButton(
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
