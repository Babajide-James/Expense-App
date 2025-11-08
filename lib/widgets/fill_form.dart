import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FillForm extends StatefulWidget {
  const FillForm(this.addTrnx, {super.key});

  final Function addTrnx;

  @override
  State<FillForm> createState() => FillFormState();
}

class FillFormState extends State<FillForm> {
  DateTime? _selectedDate;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void fillForms() {
    String input = titleController.text.trim();
    double amount = double.tryParse(amountController.text) ?? 0;
    if (input.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTrnx(input, amount, _selectedDate);
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedDate == null
                    ? 'No Date Selected!'
                    : 'picked Date:'
                          ' '
                          '${DateFormat.yMd().format(_selectedDate!)}',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              TextButton(
                onPressed: _datePicker,
                child: Text(
                  'Choose Date',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    decorationThickness: 3,
                    decorationColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: fillForms,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
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
