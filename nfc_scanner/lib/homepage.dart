import 'package:flutter/material.dart';
import 'dart:io';

import 'package:gate_server_flutter/data.dart';

var id = '0';
String name = '';
String mobile = '';
String police = '';
String unit = '';
String daf3 = '';
String mo2ahel = '';
String notes = '';
String rate = '';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    startServer();
    super.initState();
  }

  void startServer() async {
    var server =
        await HttpServer.bind(InternetAddress.anyIPv4, 3000, shared: true);
    await server.forEach((HttpRequest request) {
      request.response.headers.add("Access-Control-Allow-Origin", "*");
      request.response.headers
          .add("Access-Control-Allow-Methods", "POST,GET,DELETE,PUT,OPTIONS");
      setState(() {
        id = request.uri.toString().substring(1);
        if(id!=null && id.length>0){
          id=id.substring(0,id.length-1);
        }
        print(id);
        name = data[id]['name'];
        mobile = data[id]['mobile'];
        police = data[id]['police'];
        unit = data[id]['unit'];
        daf3 = data[id]['daf3'];
        mo2ahel = data[id]['mo2ahel'];
        notes = data[id]['notes'];
      });

      request.response.close();
    });
  }

  @override
  Widget build(BuildContext context) {
   // double h = MediaQuery.of(context).size.height;

    return Scaffold(
        body: id != '0'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "img/0.jpg",
                        width: 200,
                        height: 200,
                      ),
                    ],
                  ),
                  id != '0'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'ملف العسكري',
                              style: TextStyle(fontSize: 65),
                            ),
                            Column(
                              children: [
                                Text(
                                  'الاسم : $name',
                                  style: TextStyle(fontSize: 50),
                                ),
                                Text(
                                  'الرقم القومي : $id',
                                  style: TextStyle(fontSize: 50),
                                ),
                                Text(
                                  'رقم الشرطه : $police',
                                  style: TextStyle(fontSize: 50),
                                ),
                               const Text(
                                  'A:التقييم السلوكي  ',
                                  style: TextStyle(fontSize: 50),
                                ),
                                Text(
                                  'الوحده: $unit',
                                  style: TextStyle(fontSize: 50),
                                ),
                                Text(
                                  'دفع: $daf3',
                                  style: TextStyle(fontSize: 50),
                                ),
                                Text(
                                  'دفعة: 10-2022',
                                  style: TextStyle(fontSize: 50),
                                ),
                                Text(
                                  'المؤهل : $mo2ahel',
                                  style: TextStyle(fontSize: 50),
                                ),
                              ],
                            )
                          ],
                        )
                      : Container(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      id != '0'
                          ? Image.asset('img/$id.jpg')
                          : Container(),
                      id != '0'
                          ? Container(
                              color: Colors.white,
                              width: 500,
                              height: 200,
                              child: Center(child: Text('لايوجد ملاحظات',
                              style: TextStyle(
                                fontSize: 30

                              ),)),
                            )
                          : Container()
                    ],
                  )
                ],
              )
            : Center(
                child: Image.asset('img/0.jpg'),
              ));
  }
}
