import 'package:flutter/material.dart';

import '../constants.dart';

class CardContent extends StatelessWidget {
  final String gender;
  final IconData genderIcon;

  CardContent({required this.gender, required this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: kLabelStyle,
        )
      ],
    );
  }
}
