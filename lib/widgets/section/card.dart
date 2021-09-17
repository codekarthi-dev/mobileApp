import 'package:flutter/material.dart';
import 'package:cyn/widgets/section/slimeBox.dart';

class card extends StatelessWidget {
  String availedAmount;
  String sanctionedAmount;

  card({this.availedAmount, this.sanctionedAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 9),
      alignment: Alignment.center,
      height: 850,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: EdgeInsets.only(left: 37, right: 39),
            child: slimeBox(
              titleText: "Your availed Loan Amount is :",
              amount: availedAmount,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 37),
            child: slimeBox(
              titleText: "Your sanctioned Loan Amount is :",
              amount: sanctionedAmount,
            ),
          ),
        ],
      ),
    );
  }
}
