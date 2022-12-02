import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:nfc_manager/nfc_manager.dart';

class Nfc_scan extends StatefulWidget {
  const Nfc_scan({Key? key}) : super(key: key);

  @override
  State<Nfc_scan> createState() => _Nfc_scanState();
}

class _Nfc_scanState extends State<Nfc_scan> {

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tagRead();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network("https://img.icons8.com/ios-filled/512/rfid-tag.png"),
             Text("Reading NFC Card .....",
             style: TextStyle(
               fontSize: 30,
               color: Colors.black,
             ),
             ),
          ],
        ),
      )
    );
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      String id = '';
      List res =
      await tag.data["ndef"]["cachedMessage"]["records"][0]["payload"];
      for (final element in res) {
        id = id + String.fromCharCode(element);
      }
      id = id.substring(3);
      List <String> data =id.split(",");
      print("This is Id from Tag reader ! :${data[1]},\n This is name: ${data[0]}");

      Response response= await http.get(
        Uri.parse("http://192.168.1.10:3000/${data[1]}/${data[0]}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if(response.statusCode == 200){
        print("Sent Reuest Successfully!");

      }
      else{
        print("Error in request! ");
      }
      // NfcManager.instance.stopSession();
    });
  }
}
