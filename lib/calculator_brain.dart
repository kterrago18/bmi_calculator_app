import 'dart:math';

import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight, this.age, this.gender});

  final int height;
  final int weight;
  final int age;
  final Gender gender;

  double _bmi;

  String calculateBMI() {
    (age > 20) ? _bmi = (weight / pow(height / 100, 2)) : _bmi = ((weight / pow(height, 2)) * 10000); 
    // _bmi = weight / pow(height / 100, 2);
    print("output: $weight / pow($height / 100, 2) = ${(weight / pow(height / 100, 2))}");
    print("output2: $weight / pow($height, 2) * 10,000 = ${((weight / pow(height, 2)) * 10000)}");
     return _bmi.toStringAsFixed(1);
  }

  Widget getResultStatus() {
    if (_bmi >= 40) {
      return customText(label: 'EXTREMELY OBESE', colour: Colors.redAccent);
    } else if (_bmi > 30) {
      return customText(label: 'OBESE', colour: Colors.orangeAccent);
    } else if (_bmi > 25) {
      return customText(label: 'OVERWEIGHT', colour: Colors.yellowAccent);
    } else if (_bmi > 19) {
      return customText(label: 'HEALTHY', colour: Colors.greenAccent);
    } else {
      return customText(label: 'UNDERWEIGHT', colour: Colors.lightBlueAccent);
    }
  }

  Widget customText({String label, Color colour}) {
    return Text(label,
        style: TextStyle(
          color: colour,
          fontSize: 18.0,
        ));
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good Job';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  double getIdealWeight(){
    if(gender == Gender.male){
      //return (height - 100) - ((height - 100) * 0.10);
      return 52 + (1.9 * ((height - 152.4) / 2.54).truncate());
    } else if(gender == Gender.female){
      return 49 + (1.7 * ((height - 152.4) / 2.54).truncate());
    }
  }

}
