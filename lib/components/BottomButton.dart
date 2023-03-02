import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.message, this.toDoOnTap});

  String message;
  Function toDoOnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toDoOnTap,
      child: Container(
        child: Center(
          child: Text(
            message,
            style: kLargeButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 20.0),
        color: kBottomColor,
        height: kbottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}
