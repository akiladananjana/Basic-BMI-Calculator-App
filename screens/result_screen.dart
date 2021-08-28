import 'package:bmi_calculator/providers/DataStore.dart';
import 'package:bmi_calculator/widgets/bottomButton.dart';
import 'package:bmi_calculator/widgets/reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kBMIPageTitle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                cardColor: Provider.of<DataStore>(context, listen: false)
                    .activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Provider.of<DataStore>(context).getResult(),
                    Text(
                      Provider.of<DataStore>(context).calculateBMI(),
                      style: kBMIvalueText,
                    ),
                    Text(
                      Provider.of<DataStore>(context).getInterpretation(),
                      style: kBMIDetails,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
          BottomButton(
              buttonTitle: "RE-CALCULATE", onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
