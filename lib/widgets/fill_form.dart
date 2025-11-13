import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FillForm extends StatefulWidget {
  const FillForm(this.addTrnx, {super.key});

  final Function addTrnx;

  @override
  State<FillForm> createState() => FillFormState();
}

DateTime? _selectedDate;

class FillFormState extends State<FillForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void fillForms() {
    if (titleController.text.isEmpty) {
      return;
    }
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
      initialDate: _selectedDate,
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

  // late FocusNode _textNode;
  // late FocusNode _buttonNode;

  // @override
  // void initState() {
  //   super.initState();
  //   _textNode = FocusNode();
  //   _buttonNode = FocusNode();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _textNode.dispose();
  //   _buttonNode.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewInsets.top + 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Expenses',
                labelText: 'Title',
              ),
            ),
            SizedBox(width: 10, height: 5),
            TextField(
              // focusNode: _textNode,
              // onSubmitted: (val) => _textNode.requestFocus(),
              controller: amountController,
              decoration: InputDecoration(hintText: '\$', labelText: 'Amount'),
            ),
            SizedBox(height: 5),
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
                  onPressed: () {
                    _datePicker;
                    // FocusScope.of(context).unfocus();
                  },

                  // focusNode: _buttonNode,
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
            SizedBox(height: 5),

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
      ),
    );
  }
}
