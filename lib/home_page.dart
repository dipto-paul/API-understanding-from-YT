import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future fetchData() async{

    final url = Uri.parse("https://dummyjson.com/products/1");// alada vabe store kore niyechi

   final response = await http.get(url);
   print(response.body);
  }

  @override
  void initState() { // lifecycle theke niye asha hoyeche
    super.initState();// screen eikhan theke suru always
    fetchData();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        title: Text("API understanding from YT"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(

      ),

    );
  }
}