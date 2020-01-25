import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/utilities/calculator_brain.dart';
import 'results_page.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color inActiveCardColor = Color(0xFF111328);
const Color activeCardColor = Color(0xFF1D1E33);
const Color bottomContainerColor = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//  Color maleColor = inActiveCardColor;
//  Color femaleColor = inActiveCardColor;
//
//  // 1 = male, 2 = female
//  void updateColor(int genderType) {
//    if (genderType == 1) {
//      if (maleColor == inActiveCardColor) {
//        maleColor = activeCardColor;
//        femaleColor = inActiveCardColor;
//      } else {
//        maleColor = inActiveCardColor;
//      }
//    } else {
//      if (femaleColor == inActiveCardColor) {
//        femaleColor = activeCardColor;
//        maleColor = inActiveCardColor;
//      } else {
//        femaleColor = inActiveCardColor;
//      }
//    }
//  }
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? activeCardColor
                            : inActiveCardColor,
                        iconContent: IconContent(
                          icon: FontAwesomeIcons.mars,
                          gender: "MALE",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                          colour: selectedGender == Gender.female
                              ? activeCardColor
                              : inActiveCardColor,
                          iconContent: IconContent(
                            icon: FontAwesomeIcons.venus,
                            gender: "FEMALE",
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: activeCardColor,
                iconContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: bottomContainerColor,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 200.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                      iconContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                fillColor: Color(0xFF4C4F5E),
                                elevation: 0.0,
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                  height: 46.0,
                                  width: 46.0,
                                ),
                              ),
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                fillColor: Color(0xFF4C4F5E),
                                elevation: 0.0,
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                  height: 46.0,
                                  width: 46.0,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                      iconContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                fillColor: Color(0xFF4C4F5E),
                                elevation: 0.0,
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                  height: 46.0,
                                  width: 46.0,
                                ),
                              ),
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                fillColor: Color(0xFF4C4F5E),
                                elevation: 0.0,
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                  height: 46.0,
                                  width: 46.0,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              title: "CALCULATE YOUR BMI",
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                String bmiIndex = calc.calculateBmi();
                String bmiResult = calc.getResult();
                String bmiSuggestion = calc.getSuggestions();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: bmiResult,
                              bmiIndex: bmiIndex,
                              bmiSuggestion: bmiSuggestion,
                            )));
              },
            )
          ],
        ));
  }
}
