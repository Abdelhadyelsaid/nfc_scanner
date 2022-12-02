import 'package:flutter/material.dart';
import 'package:nfc_scanner/screens/ip_screen.dart';

import 'nfc_scan.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  void initState(){
    super.initState();
    _navigationtoOnBoared();
  }
  _navigationtoOnBoared()async{
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Ip_adress()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image(
                  image: AssetImage('assets/images/cairotrafic.png'),
                ) ,
              ),
            ],
          ),
        ));
  }
}
