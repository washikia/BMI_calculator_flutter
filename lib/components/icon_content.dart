import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.iconN, this.text});

  final IconData iconN;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconN,
          size: 100.0,
        ),
        SizedBox(height: 20.0),
        text,
      ],
    );
  }
}