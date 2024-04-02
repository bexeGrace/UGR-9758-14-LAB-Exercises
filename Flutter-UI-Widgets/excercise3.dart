import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Height',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$height',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'cm',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          Slider(
            value: height.toDouble(),
            min: 120,
            max: 220,
            onChanged: (double newValue) {
              setState(() {
                height = newValue.round();
              });
            },
          ),
          Text(
            'Weight',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$weight',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'kg',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          Slider(
            value: weight.toDouble(),
            min: 30,
            max: 150,
            onChanged: (double newValue) {
              setState(() {
                weight = newValue.round();
              });
            },
          ),
        ],
      ),
    );
  }
}
