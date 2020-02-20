import 'dart:convert';

import 'package:crypto_app/src/app.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main()  async{
  List currenries = await getCurrenries();
  runApp(App(currenries));
}

  Future<List> getCurrenries() async {
    var url = "https://api.coinmarketcap.com/v1/ticker/?limit=50";

    http.Response response =
        await http.get(url, headers: {"Accept": "application/json"});

    var decodedData = json.decode(response.body);
    return decodedData;
  }