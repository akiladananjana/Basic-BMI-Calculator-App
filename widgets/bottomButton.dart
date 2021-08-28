import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final buttonTitle;

  BottomButton({required this.buttonTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
