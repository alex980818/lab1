import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  final TextEditingController _ccontroller = TextEditingController();
  final TextEditingController _dcontroller = TextEditingController();
  double a, b, c, d, e, f;
  int j = 1;
  int _value, ans_e, ans_f;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Fraction Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(width: 50),
                Container(
                    width: 80,
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: _acontroller,
                    )),
                SizedBox(width: 90),
                Container(
                    width: 80,
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: _ccontroller,
                    )),
                SizedBox(width: 40),
              ],
            ),
            SizedBox(width: 50),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              SizedBox(width: 70),
              Text("______________     "),
              Container(
                width: 80,
                child: DropdownButton<int>(
                  items: [
                    DropdownMenuItem<int>(
                      child: Text('+'),
                      value: 1,
                    ),
                    DropdownMenuItem<int>(
                      child: Text('-'),
                      value: 2,
                    ),
                    DropdownMenuItem<int>(
                      child: Text('×'),
                      value: 3,
                    ),
                    DropdownMenuItem<int>(
                      child: Text('/'),
                      value: 4,
                    ),
                  ],
                  onChanged: (int value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  isExpanded: true,
                  hint: Text('Choose'),
                  value: _value,
                ),
              ),
              Text("  ______________"),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(width: 50),
                Container(
                    width: 80,
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: _bcontroller,
                    )),
                SizedBox(width: 90),
                Container(
                    width: 80,
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: _dcontroller,
                    )),
                SizedBox(width: 40),

              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: RaisedButton(
                    child: Text("Calculate"),
                    onPressed: _calculate,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: RaisedButton(
                    child: Text("Clear"),
                    onPressed: _clear,
                  ),
                ),
              ],
            ),
            Text(
              "\nResult: ",
              style: new TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Time New Rohman"),
            ),
            Text(
              "$ans_e",
              style: new TextStyle(
                  fontSize: 36.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Time New Rohman"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                width: 130.0,
                color: Colors.black,
              ),
            ),
            Text(
              "$ans_f",
              style: new TextStyle(
                  fontSize: 36.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Time New Rohman"),
            ),
          ],
        ),
      ),
    );
  }

  //Calculate Button
  void _calculate() {
    setState(() {
      a = double.parse(_acontroller.text);
      b = double.parse(_bcontroller.text);
      c = double.parse(_ccontroller.text);
      d = double.parse(_dcontroller.text);

      if (_value == 1) {
        //Add
        e = a * d + b * c;
        f = b * d;
        simplify();
      } else if (_value == 2) {
        //Sub
        e = a * d - b * c;
        f = b * d;
        simplify();
      } else if (_value == 3) {
        //Mult
        e = a * c;
        f = b * d;
        simplify();
      } else if (_value == 4) {
        //div
        e = a * d;
        f = b * c;
        simplify();
      }

      ans_e = e.toInt();
      ans_f = f.toInt();
    });
  }

  //For Simplified
  void simplify() {
    double factor = gcd(e, f);
    e = e / factor;
    f = f / factor;
  }

  //Greatest Common Divisor
  double gcd(double a, double b) {
    if (a == 0) {
      return b;
    } else {
      return gcd(b % a, a);
    }
  }

  //Clear Button
  void _clear() {
    setState(() {
      _acontroller.clear();
      _bcontroller.clear();
      _ccontroller.clear();
      _dcontroller.clear();
      ans_e = null;
      ans_f = null;
    });
  }
}
