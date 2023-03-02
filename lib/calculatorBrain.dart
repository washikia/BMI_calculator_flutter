
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'dart:math';

class CalculatorBrain{

  CalculatorBrain(@required this.height, @required this.weight);

  final int height;
  final int weight;
  double _bmi;

  String getBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return "Overweight";
    }
    else if(_bmi >= 18){
      return "Normal";
    }
    else{
      return "Underweight";
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return "You should work out more and eat healthy for better life";
    }
    else if(_bmi >= 18){
      return "Your BMI is in the normal range. Good Job!";
    }
    else{
      return "You should increase your carbohydrate and protein intake";
    }
  }
}