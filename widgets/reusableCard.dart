import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget? cardChild;
  final VoidCallback? onTapFunction;
  ReusableCard({required this.cardColor, this.cardChild, this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 200,
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}
