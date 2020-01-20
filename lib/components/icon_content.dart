import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constant.dart';


class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.label, this.iconColor});

  final IconData icon;
  final String label;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
          color: iconColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}