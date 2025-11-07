import 'package:flutter/material.dart';

class ChartBox extends StatelessWidget {
  const ChartBox({
    required this.totalAmount,
    required this.percentOfTotal,
    required this.label,
    super.key,
  });
  final String label;
  final double totalAmount;
  final double percentOfTotal;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            Text('\$${totalAmount.toStringAsFixed(0)}'),
            SizedBox(height: 10),
            SizedBox(
              height: 150,
              width: 20,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      border: BoxBorder.all(
                        width: 3,
                        color: Theme.of(context).primaryColor,
                      ),
                      color: Colors.purple,
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(label),
          ],
        ),
      ),
    );
  }
}
