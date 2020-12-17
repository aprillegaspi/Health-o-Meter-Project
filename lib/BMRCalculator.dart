import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health-O-Meter',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600]),
      home: BMRCalculator(),
    );
  }
}

class BMRCalculator extends StatefulWidget {
  BMRCalculator({Key key}) : super(key: key);
  @override
  _BMRCalculatorState createState() => _BMRCalculatorState();
}

class _BMRCalculatorState extends State<BMRCalculator> {
  int currentindex = 0;
  String gender;
  String result = "";
  double height = 0;
  double weight = 0;
  double age = 0;

  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "BMR Calculator",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5.0),
              Text('HEALTH-O-METER',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.w200)),
              SizedBox(
                height: 80.0,
              ),
              Row(
                children: [
                  radioButton("Man", Colors.blue, 0),
                  radioButton("Woman", Colors.pink, 1),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Enter your Age:",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: ageController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your age",
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Enter Height in CM:",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: heightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your height in cm",
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Enter Weight in KG:",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: weightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your weight in kg",
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: 60.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      age = double.parse(ageController.value.text);
                      height = double.parse(heightController.value.text);
                      weight = double.parse(weightController.value.text);
                    });
                    calculateBMR(age, height, weight);
                  },
                  color: Colors.black,
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.lightBlue)),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Your BMR is:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "$result",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void calculateBMR(double age, double height, double weight) {
    if (gender == "male") {
      double finalresult =
          66.47 + (13.75 * weight) + (5.003 * height) - (6.755 * age);
      String bmr = finalresult.toStringAsFixed(1);
      setState(() {
        result = bmr;
      });
    } else {
      double finalresult =
          655.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age);
      String bmr = finalresult.toStringAsFixed(1);
      setState(() {
        result = bmr;
      });
    }
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40.0),
        height: 60.0,
        child: FlatButton(
          color: currentindex == index ? color : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
