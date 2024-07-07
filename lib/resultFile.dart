import 'package:bmi_calculator/Container.dart';
import 'package:bmi_calculator/input_page.dart';

import 'ConstantFile.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  ResultScreen(
      { this.bmiResult,
       this.resultText,
       this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Data'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text('Your Result', style: ktitleStyle2),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: repeatContainerCode(
                colors: activeColor,
                cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 50.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        interpretation,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
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
                      'Re Calculate',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
