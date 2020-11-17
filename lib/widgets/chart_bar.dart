import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercent;
  ChartBar(this.label, this.spendingAmount, this.spendingPercent);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constrains) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5.0),
        child: Column(
          children: [
            Container(
                height: constrains.maxHeight * 0.15,
                child: FittedBox(
                    child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
            SizedBox(
              height: constrains.maxHeight * 0.05,
            ),
            Container(
              height: constrains.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        color: Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPercent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constrains.maxHeight * 0.05,
            ),
            Text(label)
          ],
        ),
      );
    });
  }
}
