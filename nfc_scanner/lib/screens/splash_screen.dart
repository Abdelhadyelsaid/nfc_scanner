import 'package:flutter/material.dart';

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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Nfc_scan()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/cairotrafic.png'),
          //   ),
          // ),
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
