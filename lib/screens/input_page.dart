import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/BottomButton.dart';
import '../calculatorBrain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  // Color maleCardColor = kInactiveCardColour;
  // Color femaleCardColor = kInactiveCardColour;
  //
  // void changeColorOnTap(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColor == kInactiveCardColour) {
  //       maleCardColor = cardColor;
  //       femaleCardColor = kInactiveCardColour;
  //     } else {
  //       maleCardColor = kInactiveCardColour;
  //     }
  //   } else if(gender == Gender.female) {
  //     if (femaleCardColor == kInactiveCardColour) {
  //       femaleCardColor = cardColor;
  //       maleCardColor = kInactiveCardColour;
  //     } else {
  //       femaleCardColor = kInactiveCardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = selectedGender == Gender.male
                            ? selectedGender = null
                            : selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      iconN: Icons.male,
                      text: Text(
                        'MALE',
                        style: kTextSmall,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = selectedGender == Gender.female
                          ? selectedGender = null
                          : selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColour,
                  cardChild: IconContent(
                    iconN: FontAwesomeIcons.venus,
                    text: Text(
                      'FEMALE',
                      style: kTextSmall,
                    ),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextSmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        kheight.toString(),
                        style: kTextBig,
                      ),
                      Text(
                        'cm',
                        style: kTextSmall,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Color(0xFFFFFFFF),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x1FEB1555),
                    ),
                    child: Slider(
                      max: 220,
                      min: 120,
                      value: kheight.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          kheight = newValue.round();
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
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextSmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              kWeight.toString(),
                              style: kTextBig,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'kg',
                              style: kTextSmall,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.horizontal_rule,
                              action: () {
                                setState(() {
                                  kWeight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: Icons.add,
                              action: () {
                                setState(() {
                                  kWeight++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveCardColor,
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kTextSmall,
                      ),
                      Text(
                        kAge.toString(),
                        style: kTextBig,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: Icons.horizontal_rule,
                            action: () {
                              setState(() {
                                kAge--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: Icons.add,
                            action: () {
                              setState(() {
                                kAge++;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  colour: kActiveCardColor,
                )),
              ],
            ),
          ),
          BottomButton(
              message: 'CALCULATE BMI',
              toDoOnTap: () {
                CalculatorBrain bmi = CalculatorBrain(kheight, kWeight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmi: bmi.getBMI(),
                      result: bmi.getResult(),
                      interpretation: bmi.getInterpretation(),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.action});

  IconData icon;
  Function action;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon),
      onPressed: action,
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
