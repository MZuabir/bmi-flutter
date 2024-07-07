import 'package:bmi_calculator/ConstantFile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './Container.dart';
import './iconTextfile.dart';
import 'resultFile.dart';
import 'roundIcon.dart';
import 'CalculatorFile.dart';

enum Gender {
  male,
  female,
}

int sliderHeight = 180;
int sliderWeight = 60;
int sliderAge = 0;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: repeatContainerCode(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  //ternary operator is used here syntax is
                  //condition ? expression to be executed on true: expression to be executed when false
                  colors: selectedGender == Gender.male
                      ? activeColor
                      : deactiveColor,
                  cardWidget: repeatTextIconWidget(
                    iconData: FontAwesomeIcons.marsDouble,
                    label: 'Male',
                  ),
                ),
              ),
              Expanded(
                child: repeatContainerCode(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  //ternary operator is used here syntax is
                  //condition ? expression to be executed on true: expression to be executed when false
                  colors: selectedGender == Gender.female
                      ? activeColor
                      : deactiveColor,
                  cardWidget: repeatTextIconWidget(
                    iconData: FontAwesomeIcons.personDress,
                    label: 'Female',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: repeatContainerCode(
            colors: Color.fromARGB(255, 47, 50, 102),
            cardWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: klabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sliderHeight.toString(),
                      style: kNumberStyle,
                    ),
                    Text('cm'),
                  ],
                ),
                Slider(
                    value: sliderHeight.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        sliderHeight = newValue.round();
                      });
                    })
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: repeatContainerCode(
                  colors: Color(0xFF1D1E33),
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: klabelStyle,
                      ),
                      Text(
                        sliderWeight.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcons(
                            iconData: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                sliderWeight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIcons(
                            iconData: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                sliderWeight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: repeatContainerCode(
                  colors: Color(0xFF1D1E33),
                  cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: klabelStyle,
                        ),
                        Text(
                          sliderAge.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcons(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  sliderAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIcons(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  sliderAge++;
                                });
                              },
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ],
          )),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: sliderHeight, weight: sliderWeight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
            child: Container(
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(
                top: 10.0,
                right: 20.0,
                left: 20.0,
              ),
              height: 80.0,
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
