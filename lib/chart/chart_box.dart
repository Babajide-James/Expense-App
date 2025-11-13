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
    return LayoutBuilder(
      builder: (context, constraint) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.13,
          // height: MediaQuery.of(context).size.height * 0.1,
          child: Column(
            children: [
              SizedBox(
                height: constraint.maxHeight * 0.15,
                child: FittedBox(
                  child: Text('\$${totalAmount.toStringAsFixed(0)}'),
                ),
              ),
              SizedBox(height: constraint.maxHeight * 0.05),
              SizedBox(
                height: constraint.maxHeight * 0.52,
                width: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        border: BoxBorder.all(
                          width: 3,
                          color: Theme.of(context).primaryColor,
                        ),
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        border: BoxBorder.all(
                          // width: 3,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: percentOfTotal,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: constraint.maxHeight * 0.05),
              FittedBox(child: Text(label)),
            ],
          ),
        );
      },
    );
  }
}
