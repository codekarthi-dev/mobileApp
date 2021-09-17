// import 'dart:html';

import 'dart:math' as math;

import 'package:cyn/api/api_config.dart';
import 'package:cyn/api/model/data.dart';
import 'package:flutter/material.dart';

import 'package:cyn/widgets/constants.dart';
import 'package:cyn/widgets/expensePageView.dart';
import 'package:localstorage/localstorage.dart';

class ExpenseGraph extends StatefulWidget {
  @override
  _ExpenseGraphState createState() => _ExpenseGraphState();
}

class _ExpenseGraphState extends State<ExpenseGraph>
    with SingleTickerProviderStateMixin {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  // animation controller
  AnimationController _controller;
  // rings animation
  Animation _tweenAnimation;
  Future<Datas> futureDatas;

  @override
  void initState() {
    super.initState();
    String id = storage.getItem("googleEmail");
    futureDatas = fetchData(id);
    // initialising the controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addListener(() {
        setState(() {});
      });

    // initialising the animation
    _tweenAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    // playing the animation
    _playAnimation();
  }

  // will play animation after some delay
  void _playAnimation() async {
    // delay
    await Future.delayed(const Duration(milliseconds: 200));
    // playing the animation
    _controller.forward();
  }

  @override
  void dispose() {
    // disposing the controller when
    // not in use
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 250.0,
      child: CustomPaint(
        painter: RingsPainter(
          blueAngle: 4.2 * math.pi / 3 * _tweenAnimation.value,
          purpleAngle: 3.5 * math.pi / 3 * _tweenAnimation.value,
          yellowAngle: 2 * math.pi / 3 * _tweenAnimation.value,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Sanctioned Amount',
                style: TextStyle(
                  color: kPrimaryTextColor.withOpacity(0.5),
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 1.0,
              ),
              FutureBuilder<Datas>(
                  future: futureDatas,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.sanctionedLoanAmount,
                        // '\₹25,000,00',
                        style: TextStyle(
                          color: kPrimaryTextColor,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
