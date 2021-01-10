import 'dart:convert';

import 'package:EfreelApp/BMRCalculator.dart';
import 'package:EfreelApp/api.dart';
import 'package:EfreelApp/home.dart';
import 'package:EfreelApp/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health-O-Meter',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600]),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool toggleValue = false;
  int pageNum = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 60.0),
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/logo.png',
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5.0),
                  Text('HEALTH-O-METER',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w200)),
                ],
              ),
              SizedBox(height: 128.0),
              pageNum == 1 ? homescreen() : pageNum == 2
            ]),
      ),
    );
  }

//1st Page
  Widget homescreen() {
    return Container(
      child: Container(
        width: 330.0,
        height: 430.0,
        child: Column(children: <Widget>[
          SizedBox(
              width: 300.0,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewScreen()),
                  );
                },
                child: Text("BMI CALCULATOR",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'Schyler',
                        fontWeight: FontWeight.w300)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.lightBlue)),
                color: Colors.black,
              )),
          SizedBox(height: 25.0),
          SizedBox(
            width: 300.0,
            height: 50.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BMRCalculator()),
                );
              },
              child: Text("BMR CALCULATOR",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.w300)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.lightBlue)),
              color: Colors.black,
            ),
          ),
          SizedBox(height: 25.0),
          SizedBox(
            width: 300.0,
            height: 50.0,
            child: RaisedButton(
              onPressed: () {},
              child: Text("WATER INTAKE",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.w300)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.lightBlue),
              ),
              color: Colors.black,
            ),
          ),
          SizedBox(height: 25.0),
          SizedBox(
            width: 300.0,
            height: 50.0,
            child: RaisedButton(
              onPressed: () {},
              child: Text("CALORIE INTAKE",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.w300)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.lightBlue)),
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.lightBlue)),
              color: Colors.black,
              splashColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => LogIn()));
              },
              child: Text(
                "LOGOUT",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  void logout() async {
    // logout from the server
    var res = await CallAPI().getData('logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => LogIn()));
    }
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 60.0),
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/logo.png',
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'HEALTH-O-METER',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Schyler',
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
              SizedBox(height: 180.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                margin: EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.white10),
                    bottom: BorderSide(width: 1.0, color: Colors.white10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '''PLEASE PROVIDE YOUR BASIC INFORMATION TO MANAGE YOUR HEALTH TRACKING ACCORDINGLY''',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w100),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.lightBlue)),
                  color: Colors.black,
                  splashColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BmiHome()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

class BmiHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BMIState();
  }
}

class BMIState extends State<BmiHome> {
  double _calc;
  String _bmiResult;
  String _status;
  String _message;

  TextEditingController _ageFieldController = TextEditingController();
  TextEditingController _heightFieldController = TextEditingController();
  TextEditingController _weightFieldController = TextEditingController();

  void _clear() {
    setState(() {
      _ageFieldController.clear();
      _heightFieldController.clear();
      _weightFieldController.clear();
    });
  }

  void _calculateBMI() {
    double height = double.parse(_heightFieldController.text);
    double weight = double.parse(_weightFieldController.text);

    if (height != null && weight != null) {
      setState(() {
        _calc = weight / pow(height / 100, 2);
        _bmiResult = _calc.toStringAsFixed(1);

        if (_calc >= 25) {
          _status = 'OVERWEIGHT';
        } else if (_calc > 18.5) {
          _status = 'NORMAL';
        } else {
          _status = 'UNDERWEIGHT';
        }
      });
    }
    setState(() {
      _calc = weight / pow(height / 100, 2);

      if (_calc >= 25) {
        _message = 'You have a higher normal weight. Try to exercise more.';
      } else if (_calc > 18.5) {
        _message = 'You have a normal weight. Good Job!';
      } else {
        _message =
            'You have a lower than normal body weight. You can eat a bit more.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: Container(
          width: 200,
          height: 719,
          child: Drawer(
            child: Container(
              child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                // Menu
                DrawerHeader(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 50.0,
                    width: 50.0,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                ListTile(
                    title: Text(
                      'My Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    }),
                ListTile(
                    title: Text(
                      'BMI CALCULATOR',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewScreen(),
                        ),
                      );
                    }),
                ListTile(
                    title: Text(
                      'BMR CALCULATOR',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BMRCalculator()),
                      );
                    }),
                ListTile(
                    title: Text(
                      'WATER INTAKE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                ListTile(
                    title: Text(
                      'CALORIE INTAKE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ]),
            ),
          ),
        ),
      ),

      //another page
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 60.0),
          Column(
            children: <Widget>[
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
            ],
          ),
          SizedBox(height: 90.0),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ToggleSwitch(
                  minWidth: 90.0,
                  initialLabelIndex: 2,
                  cornerRadius: 10.0,
                  activeFgColor: Colors.black,
                  inactiveBgColor: Colors.black,
                  inactiveFgColor: Colors.white,
                  labels: ['Male', 'Female'],
                  activeBgColors: [Colors.blue, Colors.pink],
                  onToggle: (index) {
                    print('INDEX: $index');
                  },
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: _ageFieldController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      labelText: 'Enter Your Age',
                      filled: true,
                      fillColor: Colors.white24,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      hintStyle:
                          TextStyle(color: Colors.white10, fontSize: 20)),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: _heightFieldController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      labelText: 'Enter Height in CM',
                      filled: true,
                      fillColor: Colors.white24,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      hintStyle:
                          TextStyle(color: Colors.white10, fontSize: 20)),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: _weightFieldController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Enter Weight in KG',
                    filled: true,
                    fillColor: Colors.white24,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    hintStyle: TextStyle(color: Colors.white10, fontSize: 20),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: _calculateBMI,
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.lightBlue)),
                    color: Colors.black,
                    textColor: Colors.white,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: _clear,
                    child: Text(
                      'RE-CALCULATE',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.lightBlue)),
                    color: Colors.black,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(3)),
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _bmiResult != null ? 'BMI: $_bmiResult' : '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.5,
                  ),
                ),
                Text(
                  _status != null ? _status : '',
                  style: TextStyle(color: Colors.green, fontSize: 40.0),
                ),
                Center(
                  child: Text(
                    _message != null ? _message : '',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 24.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
