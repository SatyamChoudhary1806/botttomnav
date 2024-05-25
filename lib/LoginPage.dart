import 'package:flutter/material.dart';

import 'cameraPage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  bool obsflag = true;
  var mobImp = TextEditingController();
  var OtpImp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 249,
              child: TextField(
                controller: mobImp,
                keyboardType:TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Mobile Number',
                  prefixIcon: const Icon(Icons.phone),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(
                          color: Colors.green.shade700,
                          width: 2.09
                      )
                  ),
                  enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(
                          color: Colors.brown.shade400,
                          width: 2.09
                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 249,
              child: TextField(
                controller: OtpImp,
                keyboardType:TextInputType.phone,
                obscureText: obsflag,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'OTP',
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(onPressed: (){
                    obsflag = false;
                  }, icon: const Icon(Icons.remove_red_eye_outlined)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(
                          color: Colors.blueGrey.shade600,
                          width: 2.09
                      )
                  ),
                  enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(
                          color: Colors.brown.shade400,
                          width: 2.09
                      )
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onLongPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UploadImage()));
              },
                onPressed: (){
                  String Mobile = mobImp.text.toString();
                  String OTP = OtpImp.text.toString();
                  print('Mobile Number : $Mobile, Otp : $OTP');
                },
                child: const Text('Login'))
          ],
        )
        )
    );
  }
}
