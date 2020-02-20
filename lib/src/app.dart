import 'package:crypto_app/screen/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {

  final List _currenries;

  App(this._currenries);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crypto Chart",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Home(_currenries),
    );
  }
}
