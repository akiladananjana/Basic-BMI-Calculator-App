import 'package:bmi_calculator/providers/DataStore.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/widgets/bottomButton.dart';
import 'package:bmi_calculator/widgets/cardContent.dart';
import 'package:bmi_calculator/widgets/reusableCard.dart';
import 'package:bmi_calculator/widgets/weightCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:bmi_calculator/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardColor: Provider.of<DataStore>(context, listen: true)
                          .maleCardColor,
                      cardChild: CardContent(
                        gender: "MALE",
                        genderIcon: FontAwesomeIcons.mars,
                      ),
                      onTapFunction: () {
                        Provider.of<DataStore>(context, listen: false)
                            .toggleColor(Gender.male);
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: Provider.of<DataStore>(context, listen: true)
                          .femaleCardColor,
                      cardChild: CardContent(
                        gender: "FEMALE",
                        genderIcon: FontAwesomeIcons.venus,
                      ),
                      onTapFunction: () {
                        Provider.of<DataStore>(context, listen: false)
                            .toggleColor(Gender.female);
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardColor: Provider.of<DataStore>(context, listen: false)
                    .activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: kLabelStyle,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          Provider.of<DataStore>(context)
                              .height
                              .round()
                              .toString(),
                          style: kFontLabel,
                        ),
                        Text("cm"),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0XFFEB1555),
                          overlayColor: Color(0X29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: Provider.of<DataStore>(context, listen: true)
                            .height
                            .toDouble(),
                        activeColor: Color(0XFFEB1555),
                        inactiveColor: Color(0XFF8D8E98),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (newValue) {
                          Provider.of<DataStore>(context, listen: false)
                              .changeSlider(newValue);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardColor: Provider.of<DataStore>(context, listen: false)
                          .activeCardColor,
                      cardChild: WeightCard(
                        title: "WEIGHT",
                        unit: "kg",
                        parameter: ChangeParameter.weight,
                        value: Provider.of<DataStore>(context, listen: true)
                            .weight
                            .toString(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: Provider.of<DataStore>(context, listen: false)
                          .activeCardColor,
                      cardChild: WeightCard(
                        title: "Age",
                        unit: "Y",
                        parameter: ChangeParameter.age,
                        value: Provider.of<DataStore>(context, listen: true)
                            .age
                            .toString(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              buttonTitle: "CALCULATE BMI",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ResultScreen(),
                  ),
                );
              },
            )
          ],
        ));
  }
}
