import 'package:bmi_calculator/providers/DataStore.dart';
import 'package:bmi_calculator/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class WeightCard extends StatelessWidget {
  final String title;
  final String unit;
  final ChangeParameter parameter;
  String value;
  WeightCard(
      {required this.title,
      required this.value,
      required this.unit,
      required this.parameter});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: kLabelStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              value,
              style: kFontLabel,
            ),
            Text(unit)
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              buttonIcon: FontAwesomeIcons.plus,
              onPressed: () {
                Provider.of<DataStore>(context, listen: false)
                    .increseValue(parameter);
              },
            ),
            SizedBox(
              width: 10,
            ),
            RoundedButton(
              buttonIcon: FontAwesomeIcons.minus,
              onPressed: () {
                Provider.of<DataStore>(context, listen: false)
                    .decreseValue(parameter);
              },
            )
          ],
        )
      ],
    );
  }
}
