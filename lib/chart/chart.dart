import 'package:flutter/material.dart';
import '../models/model.dart';
import 'package:intl/intl.dart';
import 'chart_box.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransaction, {super.key});
  final List<Transaction> recentTransaction;

  List<Map<String, Object>> get myTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.00;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum.toStringAsFixed(0),
      };
    });
  }

  double get totalExpense {
    return myTransactions.fold(0.0, (x, y) {
      return x + double.parse(y['amount'] as String);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(15),
      child: Row(
        children: myTransactions.map((data) {
          return ChartBox(
            label: data['day'] as String,
            totalAmount: double.parse(data['amount'] as String),
            percentOfTotal: totalExpense == 0
                ? 0.00
                : double.parse(data['amount'] as String) / totalExpense,
          );
        }).toList(),
      ),
    );
  }
}
