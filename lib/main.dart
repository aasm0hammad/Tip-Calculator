import 'package:flutter/material.dart';
import 'tipcal.dart';
void main() {
  runApp(Aas());
}

TextEditingController totalBiiController = TextEditingController();

class Aas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:TipCal1 (),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TipCal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TipCalState();
}

class TipCalState extends State<TipCal> {
  double tip = 0;
  double totalBillAmount = 0;
  int value=1;
  double perPerson=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tip Cal"),
        ),
        body: StatefulBuilder(builder: (context, ss) {
          return Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Vii(),
                ),
                Expanded(
                  flex: 5,
                  child: Card(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(31),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Total p/person",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: "\$",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900),
                                  children: [
                                    TextSpan(
                                        text: perPerson.toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: 38,
                                            fontWeight: FontWeight.w900))
                                  ]),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Total bill",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text.rich(TextSpan(
                                        text: "\$",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff00CABE),
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: totalBillAmount.toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xff00CABE),
                                                  fontWeight: FontWeight.bold)),
                                        ]))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Total tip",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text.rich(TextSpan(
                                        text: "\$",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff00CABE),
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: tip.toStringAsFixed(2),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xff00CABE),
                                                  fontWeight: FontWeight.bold)),
                                        ]))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text.rich(TextSpan(
                            text: "Enetr\n",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: "Your bill",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ])),
                      ),
                      Expanded(
                          flex: 3,
                          child: TextField(
                            controller: totalBiiController,
                            decoration: InputDecoration(
                                filled: true,
                                prefixText: "\$",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  style: BorderStyle.none,
                                  color: Colors.white,
                                  width: 1,
                                ))),
                          )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text.rich(TextSpan(
                              text: "Choose\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 21),
                              children: [
                                TextSpan(
                                    text: "your tip",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ])),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            tip = double.parse(
                                                    totalBiiController.text) *
                                                0.1;
                                            totalBillAmount = double.parse(
                                                    totalBiiController.text) +
                                                tip;
                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xff00CABE),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text.rich(TextSpan(
                                                  text: "10",
                                                  style: TextStyle(
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                  children: [
                                                    TextSpan(
                                                      text: "%",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ])),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 11,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            tip = double.parse(
                                                    totalBiiController.text) *
                                                0.15;
                                            totalBillAmount = double.parse(
                                                    totalBiiController.text) +
                                                tip;
                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xff00CABE),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text.rich(TextSpan(
                                                  text: "15",
                                                  style: TextStyle(
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                  children: [
                                                    TextSpan(
                                                      text: "%",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ])),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 11,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            tip = double.parse(
                                                    totalBiiController.text) *
                                                0.2;
                                            totalBillAmount = double.parse(
                                                    totalBiiController.text) +
                                                tip;

                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xff00CABE),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text.rich(TextSpan(
                                                  text: "20",
                                                  style: TextStyle(
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                  children: [
                                                    TextSpan(
                                                      text: "%",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ])),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xff00CABE),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Custom Tip",
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text.rich(TextSpan(
                              text: "Split\n",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: "the total",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ])),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child:  GestureDetector(
                                    onTap: (){
                                      if(value>1) {
                                        value--;
                                      }
                                      perPerson=totalBillAmount/value;
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(16),
                                            topLeft: Radius.circular(16)),
                                        color: Color(0xff00CABE),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "-",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21),
                                      )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xfffffff),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "${value}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21),
                                    )),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      value++;
                                      perPerson=totalBillAmount/value;
                                      setState(()
                                      {

                                      }
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(16),
                                            topRight: Radius.circular(16)),
                                        color: Color(0xff00CABE),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "+",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          );
        }));
  }
}

Widget Vii() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset("assets/images/img.png"),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
                text: "Mr",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: "TIP",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w900))
                ]),
          ),
          Text("Calculater",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
        ],
      ),
    ],
  );
}
