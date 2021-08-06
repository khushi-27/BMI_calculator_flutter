import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class IconContent extends StatefulWidget {
  final IconData icon;
  final String text;

  const IconContent({
    required this.icon,
    required this.text,
  });

  @override
  _IconContentState createState() => _IconContentState();
}

class _IconContentState extends State<IconContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          widget.icon,
          color: Colors.white,
          size: 80.0,
        ),
        const SizedBox(height: 15.0),
        Text(
          widget.text,
          style: TextStyle(fontSize: 20.0, color: grey),
        )
      ],
    );
  }
}
