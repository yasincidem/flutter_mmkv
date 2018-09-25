import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_mmkv/flutter_mmkv.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _rootDir = 'Unknown';
  String _mystring;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String rootDir;
    String mystring;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      rootDir = await FlutterMmkv.getRootDir();


    } on PlatformException {
      rootDir = 'Failed to get';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _rootDir = rootDir;
      _mystring = mystring;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FlutterMMKV Plugin'),
        ),
        body: Column(
          children: [
            Text('Root Directory : $_rootDir\n'),
            Text('MMKV String :${FlutterMmkv.decodeString("mystring")}'),
            TextField(
              controller: myController,
            )
          ]
        ),
        floatingActionButton: FloatingActionButton(
          child: IconButton(icon: Icon(Icons.add), onPressed: null),
          onPressed: () {
            FlutterMmkv.encodeString("mystring", myController.text.toString());
          }),
      ),
    );
  }
}