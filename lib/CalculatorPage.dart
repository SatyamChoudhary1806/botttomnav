import 'package:botttomnav/bmimain.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorPage();
}

class _CalculatorPage extends State<CalculatorPage>{
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();
  var result = "Result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          color: Colors.yellow.shade50,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(controller: no1Controller,keyboardType: TextInputType.number,),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(controller: no2Controller,keyboardType: TextInputType.number,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    var value1= int.parse(no1Controller.text.toString());
                    var value2= int.parse(no2Controller.text.toString());

                    var sum = value2+value1;
                    print('$sum');
                    result = "The summation is $sum";
                    setState(() {

                    });
                  }, child: const Text('Add')),
                  ElevatedButton(onPressed: (){
                    var value1= int.parse(no1Controller.text.toString());
                    var value2= int.parse(no2Controller.text.toString());

                    var sum = value1-value2;
                    print('$sum');
                    result = "The difference is $sum";
                    setState(() {});
                  }, child: const Text('Sub')),
                  ElevatedButton(onPressed: (){
                    var value1= int.parse(no1Controller.text.toString());
                    var value2= int.parse(no2Controller.text.toString());

                    var sum = value1*value2;
                    print('$sum');
                    result = "The product is $sum";
                    setState(() {});
                  }, child: const Text('Mul')),
                  ElevatedButton(onPressed: (){
                    var value1= int.parse(no1Controller.text.toString());
                    var value2= int.parse(no2Controller.text.toString());

                    var sum = value1/value2;
                    print('$sum');
                    result = "The division is ${sum.toStringAsFixed(2)}";
                    setState(() {});
                  }, child: const Text('Div')),
                ],
              ),
              Text(result,style: const TextStyle(fontSize: 23, color: Colors.cyan),),
              const SizedBox(height: 22),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BMImainScreen()));
              }, child: const Text('BMI Calculator'))
            ],
          ),
        )
    );
  }

}