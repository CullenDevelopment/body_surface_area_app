import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BodySurfaceArea(),// Calculates BSA
      debugShowCheckedModeBanner: false,
    );
  }
}

class BodySurfaceArea extends StatefulWidget {
  @override
  _BodySurfaceAreaState createState() => _BodySurfaceAreaState();
}

class _BodySurfaceAreaState extends State<BodySurfaceArea> {

  TextEditingController _weight = new TextEditingController();
  TextEditingController _length = new TextEditingController();

  double weight = 0;
  double length = 0;
  double bsa = 0;
  double bsaSquared = 0;

  String weightValue = "0.0";
  String lengthValue = "0.0";
  String bodySurfaceArea = "0.0";

 @override
  void initState() {
    _weight = TextEditingController();
    _length = TextEditingController();

    super.initState();
  }

  void dispose(){
   _weight.dispose();
   _length.dispose();
   super.dispose();
  }

  // ignore: non_constant_identifier_names
  void Calculation(){
   weightValue = _weight.text;
   lengthValue = _length.text;
   weight = double.parse(weightValue);
   length = double.parse(lengthValue);

   bsaSquared = (weight * length) / 3600;

   bsa = sqrt(bsaSquared);

   bodySurfaceArea = bsa.toStringAsFixed(3);

   setState(() {
     bodySurfaceArea;
   });
 }

 // ignore: non_constant_identifier_names
 void Reset(){
   setState(() {
     _weight.text = "";
   });
   setState(() {
     _length.text = "";
   });
   setState(() {
     bodySurfaceArea = "0.0";
   });
 }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: double.maxFinite,
                ),
                Text("Body Surface Area",
                style: TextStyle(color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                ),
                ),
                SizedBox(
                  height: 10,
                  width: double.maxFinite,
                ),
                Text("Calculator",
                  style: TextStyle(color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: double.maxFinite,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 120,
                          height: 60,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 40, top: 10, right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Weight(kg)",
                              ),
                              keyboardType: TextInputType.number,
                              controller: _weight,
                              onChanged: (weightValue){
                                return weightValue;
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: Text("Weight(kg)",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 120,
                          height: 60,
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(left: 40, top: 10, right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Length(cm)",
                              ),
                              keyboardType: TextInputType.number,
                              controller: _length,
                              onChanged: (lengthValue){
                                return lengthValue;
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: Text("Length(cm)",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                  width: double.maxFinite,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ignore: deprecated_member_use
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20, right: 10, bottom: 20, top: 20),
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            color: Colors.blue,
                              splashColor: Colors.redAccent,
                              child: Text("Calculate",
                              style: TextStyle(color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              ),
                              ),
                              onPressed: () {
                              Calculation();
                            }
                              ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20, right: 10, bottom: 50),
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                              color: Colors.blue,
                              splashColor: Colors.redAccent,
                              child: Text("Reset",
                                style: TextStyle(color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () {
                                Reset();

                              }
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 120,
                          height: 60,
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(left: 40, right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(right:35, top: 20),
                            child: Text("$bodySurfaceArea",
                              style: TextStyle(color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: Text("Body Surface",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, top: 5),
                          child: Text("Area metres sq.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

        )
    );
  }
}

