import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final String text;
  final void Function() onTapBottom;
  const BottomBar({Key? key, required this.text, required this.onTapBottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapBottom,
      child: Container(
        height: 50.0,
        margin: const EdgeInsets.only(top: 8.0),
        color: pink,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0),
          ),
        ),
      ),
    );
  }
}
