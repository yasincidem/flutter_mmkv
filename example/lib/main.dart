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
      mystring = await FlutterMmkv.decodeString("mystring");

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
            Column(
              children: <Widget>[
                Text('Root Directory : $_rootDir\n'),
                Text('MMKV String :$_mystring'),
                TextField(
                  controller: myController,
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: (){
                          FlutterMmkv.encodeString("mystring", myController.text.toString());
                          FlutterMmkv.decodeString("mystring").then((value) {
                            this.setState(() {
                              _mystring = value;
                            });
                          });
                        },
                        child: Text('Encode'),
                      ),
                      RaisedButton(
                        onPressed: (){
                          FlutterMmkv.removeAll().then((value) {
                            FlutterMmkv.decodeString("mystring").then((value) {
                              this.setState(() {
                                _mystring = value;
                              });
                            });
                          });
                        },
                        child: Text('Remove'),
                      )
                    ],
                  ),
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}