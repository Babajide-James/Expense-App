import 'package:flutter/material.dart';
import 'package:for_expense/models/model.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.transaction});

  final List<Transaction> transaction;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 570,
      child: widget.transaction.isEmpty
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
                  child: Image.asset('assets/image/ajs.jpg', fit: BoxFit.fill),
                ),
              ],
            )
          : ListView.builder(
              itemCount: widget.transaction.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: 10,
                          left: 10,
                          // top: 10,
                          // bottom: 10,
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: BoxBorder.all(width: 2),
                        ),
                        child: Text(
                          '\$${widget.transaction[index].amount}'.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.transaction[index].item,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            DateFormat(
                              'd MMM. y',
                            ).format(widget.transaction[index].date),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
