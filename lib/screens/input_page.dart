import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/widgets/bottom_bar.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';

enum Gender { male, female }
int weight = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 160;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild: IconContent(
                          icon: Icons.male,
                          text: 'MALE',
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        }),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: selectedGender == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild: IconContent(
                          icon: Icons.female,
                          text: 'FEMALE',
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        }),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: TextStyle(fontSize: 20.0, color: grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              'cm',
                              style: TextStyle(fontSize: 20.0, color: grey),
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                              trackHeight: 0.5,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                              thumbColor: pink,
                              overlayColor: Color(0x29EB1555),
                              activeTrackColor: Colors.white),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            inactiveColor: grey,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    onPress: () {})),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                          colour: activeCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: TextStyle(fontSize: 20.0, color: grey),
                              ),
                              Text(
                                weight.toString(),
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingButton(
                                    icon: Icons.add,
                                    onPressWeight: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10.0),
                                  FloatingButton(
                                    icon: Icons.remove,
                                    onPressWeight: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          onPress: () {})),
                  Expanded(
                      child: ReusableCard(
                          colour: activeCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: TextStyle(fontSize: 20.0, color: grey),
                              ),
                              Text(
                                age.toString(),
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingButton(
                                    icon: Icons.add,
                                    onPressWeight: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10.0),
                                  FloatingButton(
                                    icon: Icons.remove,
                                    onPressWeight: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          onPress: () {})),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(
          text: 'CALCULATE',
          onTapBottom: () {
            Calculator calc = Calculator(height: height, weight: weight);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmiResult: calc.CalculateBmi(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        )));
          },
        ),
      ),
    );
  }
}

class FloatingButton extends StatefulWidget {
  final IconData icon;
  final void Function()? onPressWeight;

  const FloatingButton(
      {Key? key, required this.icon, required this.onPressWeight});

  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF4C4F5E),
      onPressed: widget.onPressWeight,
      child: Icon(
        widget.icon,
        color: Colors.white,
      ),
    );
  }
}
