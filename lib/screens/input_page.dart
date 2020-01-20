import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_app/components/icon_content.dart';
import 'package:bmi_calculator_app/components/reusable_card.dart';
import 'package:bmi_calculator_app/constant.dart';
import 'result_page.dart';
import 'package:bmi_calculator_app/components/bottom_button.dart';
import 'package:bmi_calculator_app/components/round_icon_button.dart';
import 'package:bmi_calculator_app/calculator_brain.dart';

enum Gender {
  male,
  female,
}
enum Unit {
  ft,
  cm,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.female;
  Unit selectedUnit = Unit.cm;
  static int heightValue = 175;
  int weight = 72;
  int age = 26;
  String unit = 'cm';
  String height = heightValue.toString();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                      iconColor: selectedGender == Gender.male
                          ? Color(0xFFFFFFFF)
                          : Color(0x29FFFFFF),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                      iconColor: selectedGender == Gender.female
                          ? Color(0xFFFFFFFF)
                          : Color(0x29FFFFFF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RectangleButton(
                        onTap: () {
                          setState(() {
                            unit = 'cm';
                            selectedUnit = Unit.cm;
                            height = heightValue.toStringAsFixed(0);
                          });
                        },
                        text: 'CM',
                        colour: selectedUnit == Unit.cm
                            ? Colors.pinkAccent
                            : kInactiveCardColor,
                        radius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                      ),
                      RectangleButton(
                          onTap: () {
                            setState(() {
                              unit = 'ft';
                              selectedUnit = Unit.ft;
                              height = "${(heightValue / 30.48).truncate()}'${((heightValue % 30.48) / 2.54).truncate() }\"";
                              //height = (heightValue / 30.48).toStringAsFixed(1);
                            });
                          },
                          text: 'FT',
                          colour: selectedUnit == Unit.ft
                              ? Colors.pinkAccent
                              : kInactiveCardColor,
                          radius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kValueTextStyle,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        unit,
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFFF4181),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x29FF4181),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: heightValue.toDouble(),
                      min: 142,
                      max: 211,
                      onChanged: (double newValue) {
                        setState(() {
                          heightValue = newValue.round();

                          if (selectedUnit == Unit.cm) {
                            height = newValue.toStringAsFixed(0);
                          } else if (selectedUnit == Unit.ft) {
                             height = "${(heightValue / 30.48).truncate()}'${((heightValue % 30.48) / 2.54).truncate() }\"";
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kValueTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    (weight > 1) ? weight-- : weight;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    (weight < 132) ? weight++ : weight;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kValueTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    (age > 2) ? age-- : age;
                                    print(age);
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                     (age < 100) ? age++ : age;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                  height: heightValue,
                  weight: weight,
                  age: age,
                  gender: selectedGender);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResultStatus(),
                    interpretation: calc.getInterpretation(),
                    idealWeight: calc.getIdealWeight().round().toString(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class RectangleButton extends StatelessWidget {
  RectangleButton({this.text, this.colour, this.radius, @required this.onTap});

  final String text;
  final Color colour;
  final BorderRadius radius;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 80.0,
          height: 40.0,
          child: Center(
            child: Text(
              text,
              style: kUnitTextStyle,
            ),
          ),
          decoration: BoxDecoration(color: colour, borderRadius: radius),
        ),
      ),
    );
  }
}
