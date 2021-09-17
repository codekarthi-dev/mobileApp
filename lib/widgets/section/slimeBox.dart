import 'package:flutter/material.dart';
import 'package:cyn/widgets/section/slimy_card.dart';

class slimeBox extends StatelessWidget {
  String titleText;
  String amount;

  slimeBox({this.titleText, this.amount});

  @override
  Widget build(BuildContext context) {
    return SlimyCard(
      slimeEnabled: false,
      width: 300,
      topCardHeight: 280,
      bottomCardHeight: 200,
      // borderRadius: 15,
      topCardWidget: Stack(
        children: [
          Text(
            titleText,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white70),
          )
        ],
      ),
      bottomCardWidget: Stack(
        children: [
          Text(amount,
              style: TextStyle(
                fontSize: 30,
              ))
        ],
      ),
      color: Color(
        0xFF01dcdc,
      ),
    )

        // margin: EdgeInsets.only(top: 30, left: 40, right: 30),
        ;
  }
}
