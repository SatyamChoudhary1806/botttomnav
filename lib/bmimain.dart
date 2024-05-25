import 'package:flutter/material.dart';

import 'CalculatorPage.dart';

class BMImainScreen extends StatefulWidget {
  const BMImainScreen({super.key});

  @override
  State<BMImainScreen> createState() => _BMImainScreenState();
}

class _BMImainScreenState extends State<BMImainScreen> {
  var wtin = TextEditingController();
  var ftin = TextEditingController();
  var inin = TextEditingController();
  var result = "";
  var msg = "";

  var bgColor = Colors.indigo.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: 249,
                  child: TextField(
                    controller: wtin,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.line_weight),
                      hintText: 'Weight in Kg',
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                              color: Colors.blue.shade100, width: 2.3)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                              color: Colors.blue.shade300, width: 2.3)),
                    ),
                  ),
                ),
              ),
              Container(
                width: 249,
                margin: const EdgeInsets.all(10),
                child: TextField(
                  controller: ftin,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.height_outlined),
                    hintText: 'Height in ft',
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: Colors.blue.shade100, width: 2.3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: Colors.blue.shade300, width: 2.3)),
                  ),
                ),
              ),
              SizedBox(
                width: 249,
                child: TextField(
                  controller: inin,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.height_outlined),
                    hintText: 'Height in inches',
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: Colors.blue.shade100, width: 2.3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: Colors.blue.shade300, width: 2.3)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      var Wt = int.parse(wtin.text.toString());
                      var Ft = int.parse(ftin.text.toString());
                      var In = int.parse(inin.text.toString());

                      if (Wt != "" && Ft != "" && In != "") {
                        var tinch = (Ft * 12) + In;
                        var tM = (tinch * 2.54) / 100;
                        var BMI = Wt / (tM * tM);
                        result = "Your BMI is ${BMI.toStringAsFixed(3)}";
                        setState(() {
                          if (BMI > 25) {
                            msg = "You are OverWeight";
                            bgColor = Colors.orange.shade200;
                          } else if (BMI < 18) {
                            msg = "You are UnderWeight";
                            bgColor = Colors.red.shade200;
                          } else {
                            msg = "You are Healthy";
                            bgColor = Colors.greenAccent.shade200;
                          }
                        });
                      } else {
                        setState(() {
                          result = "Please Fill all teh required Blanks!!";
                        });
                      }
                    },
                    child: const Text('Calculate BMI')),
              ),
              SizedBox(
                  width: 249,
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        msg,
                        style: const TextStyle(
                            fontSize: 16.60, color: Colors.white),
                      ),
                      Text(
                        result,
                        style: TextStyle(
                            fontSize: 16.60,
                            color: Colors.deepPurpleAccent.shade100),
                      ),
                    ],
                  )
                  )
              ),
              const SizedBox(height: 22),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CalculatorPage()));
                  },
                  child: const Text('Calculator'))
            ],
          ),
        ));
  }
}
