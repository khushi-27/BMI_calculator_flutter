import 'package:flutter/material.dart';

import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/widgets/bottom_bar.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage({
    Key? key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Your Result',
          style: TextStyle(fontSize: 28.0),
        ),
        leading: Container(),
      ),
      body: ReusableCard(
          colour: activeCardColor,
          cardChild: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  resultText,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0),
                ),
                Text(bmiResult,
                    style:
                        TextStyle(fontSize: 60.0, fontWeight: FontWeight.w900)),
                Text(
                  interpretation,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17.0),
                )
              ],
            ),
          ),
          onPress: () {}),
      bottomNavigationBar: BottomBar(
        text: 'RE-CALCULATE',
        onTapBottom: () {
          Navigator.pop(context);
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => InputPage()));
        },
      ),
    );
  }
}
