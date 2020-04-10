import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              '\$${spendingAmount.toStringAsFixed(0)}',
            ),
          ),
        ),
        SizedBox(height: 4),
        Container(
            height: 70,
            width: 12,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffbfcddc), width: 2.0),
                    color: const Color(0xffbfcddc),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [ new BoxShadow(
                      color: Colors.grey,
                      offset: new Offset(1.0,2.0),
                    )]
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            )),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
