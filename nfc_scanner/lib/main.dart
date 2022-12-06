import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

void main(List<String> args) async{
  runApp(const MyApp());
  if (Platform.isWindows) {
    Size size = await DesktopWindow.getWindowSize();
    print(size);
    await DesktopWindow.setWindowSize(Size(1920,1080));

    await DesktopWindow.setMinWindowSize(Size(1700,960));
    await DesktopWindow.setMaxWindowSize(Size(1920,1080));

    //  await DesktopWindow.resetMaxWindowSize();
    await DesktopWindow.toggleFullScreen();
    bool isFullScreen = await DesktopWindow.getFullScreen();
    await DesktopWindow.setFullScreen(true);
    // await DesktopWindow.setFullScreen(false);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
