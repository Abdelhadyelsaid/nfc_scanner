import 'package:flutter/material.dart';
import 'package:nfc_scanner/screens/nfc_scan.dart';

class Ip_adress extends StatefulWidget {


  const Ip_adress({Key? key}) : super(key: key);

  @override
  State<Ip_adress> createState() => _Ip_adressState();
}

class _Ip_adressState extends State<Ip_adress> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _ipController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ip is required !';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter local IP adress",
                    border: InputBorder.none,
                    counter: Offstage(),
                    filled: true,
                    fillColor: Color(0x07000000),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(width: 1, color: Color(0xff8743ff)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              width: 200,
              height: 56,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Color.fromRGBO(255, 79, 4, 10),
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                // color:Color.fromRGBO(255, 79, 4, 30),
              ),
              child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Nfc_scan(ip: _ipController.text)));
                    }
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromRGBO(255, 79, 4, 10),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
