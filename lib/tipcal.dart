import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextEditingController totalBiiController = TextEditingController();
TextEditingController customTipController = TextEditingController();

class TipCal1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TipCalState();
}

class TipCalState extends State<TipCal1> {
  double tip = 0;
  double totalBillAmount = 0;
  int value = 1;
  double perPerson = 0;
  double tipPresent = 0;
  double totalBill = 0;
  bool isCustomTip = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text(
            "Tip Calculator",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            physics:
                ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).padding.top + kToolbarHeight)),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TipImage(),
                      ),
                      Expanded(
                        flex: 5,
                        child: Card(
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(31),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Total p/person",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                        text: "\$",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                        children: [
                                          TextSpan(
                                              text:
                                                  perPerson.toStringAsFixed(2),
                                              style: TextStyle(
                                                  fontSize: 38,
                                                  fontWeight: FontWeight.w900))
                                        ]),
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                    text: totalBill
                                                        .toStringAsFixed(2),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            Color(0xff00CABE),
                                                        fontWeight:
                                                            FontWeight.bold)),
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
                                                    text:
                                                        tip.toStringAsFixed(2),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            Color(0xff00CABE),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ]))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
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
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: "Your bill",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ])),
                            ),
                            Expanded(
                                flex: 3,
                                child: SizedBox(
                                  height: 50,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: totalBiiController,
                                    onChanged: (value) {
                                     calculatorResult();
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintText: "\$",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          style: BorderStyle.none,
                                          color: Colors.black,
                                          width: 1,
                                        )),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ))),
                                  ),
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21),
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
                                                  tipPresent = 10;
                                                  calculatorResult();
                                                },
                                                child: Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff00CABE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: Text.rich(TextSpan(
                                                        text: "10",
                                                        style: TextStyle(
                                                            fontSize: 21,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                        children: [
                                                          TextSpan(
                                                            text: "%",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
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
                                                  tipPresent = 15;
                                                  calculatorResult();
                                                },
                                                child: Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff00CABE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: Text.rich(TextSpan(
                                                        text: "15",
                                                        style: TextStyle(
                                                            fontSize: 21,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                        children: [
                                                          TextSpan(
                                                            text: "%",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
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
                                                  tipPresent = 20;
                                                  calculatorResult();
                                                },
                                                child: Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff00CABE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: Text.rich(TextSpan(
                                                        text: "20",
                                                        style: TextStyle(
                                                            fontSize: 21,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                        children: [
                                                          TextSpan(
                                                            text: "%",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
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
                                        child: Stack(
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  LengthLimitingTextInputFormatter(
                                                      3),

                                                ],
                                                controller: customTipController,
                                                onChanged: (value) {
                                                  if(value.trim().isEmpty){
                                                    tipPresent=0;
                                                  }else{
                                                  tipPresent =
                                                      double.tryParse(value)!;}
                                                  calculatorResult();
                                                },
                                                decoration: InputDecoration(
                                                    filled: true,
                                                    hintText: "%",
                                                    focusColor: Colors.red,
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                      style: BorderStyle.none,
                                                      width: 1,
                                                    )),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ))),
                                              ),
                                            ),
                                            isCustomTip
                                                ? Container()
                                                : InkWell(
                                                    onTap: () {
                                                      isCustomTip = true;
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff00CABE),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        "Custom Tip",
                                                        style: TextStyle(
                                                            fontSize: 21,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                    ),
                                                  ),
                                          ],
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
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
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
                                        child: GestureDetector(
                                          onTap: () {
                                            if (value > 1) {
                                              value--;
                                              calculatorResult();
                                            }
                                          },
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(16),
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
                                          onTap: () {
                                            value++;
                                            calculatorResult();
                                          },
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(16),
                                                  topRight:
                                                      Radius.circular(16)),
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
                ),
              ),
            )));
  }

  void calculatorResult() {
    if (totalBiiController.text != "") {
      totalBillAmount = double.parse(totalBiiController.text);
      tip = totalBillAmount * (tipPresent / 100);
      totalBill = totalBillAmount + tip;
      perPerson = totalBill / value;

      setState(() {});
    } else {
      tip=0;
      totalBill=0;
      perPerson=0;
      totalBillAmount=0;
      tipPresent=0;
      value = 1;
      setState(() {});
    }
  }
}

Widget TipImage() {
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
          Text("Calculator",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
        ],
      ),
    ],
  );
}
