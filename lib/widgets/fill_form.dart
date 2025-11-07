import 'package:flutter/material.dart';

class FillForm extends StatefulWidget {
  const FillForm(this.addTrnx, {super.key});

  final Function addTrnx;

  @override
  State<FillForm> createState() => _FillFormState();
}

class _FillFormState extends State<FillForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Expenses',
              labelText: 'Title',
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(12),
              // ),
            ),
          ),
          SizedBox(width: 20, height: 20),
          TextField(
            controller: amountController,
            decoration: InputDecoration(
              hintText: '\$',
              labelText: 'Amount',

              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(12),
              // ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  (widget.addTrnx(
                    titleController.text,
                    double.parse(amountController.text),
                  ));
                  titleController.clear();
                  amountController.clear();
                },

                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
