import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final IconData? buttonIcon;
  final VoidCallback onPressed;
  RoundedButton({this.buttonIcon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0XFF8D8E98),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(buttonIcon),
    );
  }
}
