import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      title: 'Health-O-Meter',
      theme: ThemeData(
//        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Health Meter'),
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
  bool isMessage = true;
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
            isMessage ? message() : birthDate()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isMessage = !isMessage;
          });
        },
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 29,
        ),
        backgroundColor: Colors.blue,
        elevation: 5,
        splashColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget message() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
      margin: EdgeInsets.symmetric(vertical: 60.0),
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
    );
  }

  Widget birthDate() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
        child: Column(
          children: [
            Container(
                child: Text("ENTER BIRTHDATE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Schyler',
                        fontWeight: FontWeight.w300))),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                  width: 60,
                  child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white24,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: ' DD',
                          hintStyle:
                              TextStyle(color: Colors.white10, fontSize: 20)))),
              Container(
                width: 10,
              ),
              Container(
                  width: 60,
                  child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white24,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'MM',
                          hintStyle:
                              TextStyle(color: Colors.white10, fontSize: 20)))),
              Container(
                width: 10,
              ),
              Container(
                  width: 120,
                  child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white24,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: '     YYYY',
                          hintStyle:
                              TextStyle(color: Colors.white10, fontSize: 20)))),
            ])
          ],
        ));
  }
}
