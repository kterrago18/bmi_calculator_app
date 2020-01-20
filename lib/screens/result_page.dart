import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constant.dart';
import 'package:bmi_calculator_app/components/reusable_card.dart';
import 'package:bmi_calculator_app/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiResult, this.resultText, this.interpretation, this.idealWeight});

  final String bmiResult;
  final Widget resultText;
  final String interpretation;
  final String idealWeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    resultText,
                    Text(
                      bmiResult,
                      style: kResultValueTextStyle,
                    ),
                    Text(
                      interpretation,
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('IDEAL WEIGHT', style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(idealWeight, style: kValueTextStyle),
                      Text('KG', style: kLabelTextStyle)
                    ],
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              text: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
