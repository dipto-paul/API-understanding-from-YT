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

  List<dynamic> posts = [];// fetchData r bahire api use korar jonno eita neua

  Future fetchData() async {
    final url = Uri.parse(
      "https://dummyjson.com/products",
    ); // alada vabe store kore niyechi

    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("Success !");

      print(response.body);

      final jsonData = jsonDecode(response.body); //String data ke Json e convert

      print(jsonData['products'].length);

      posts = jsonData['products'] as List; //map data ke list e convert korar jonno as list

     // print(posts);

    } else {
      print("Somewhere is failed , please find the problem");
    }
  }



  @override
  void initState() {// lifecycle theke niye asha hoyeche
    super.initState(); // screen eikhan theke suru always
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("API understanding using Postman", style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemCount: posts.length,
          itemBuilder: (_, index){ // (_) means contexxt
          return Card(
            child: ListTile(
              leading: Image.network(posts[index]['thumbnail']),
              title: Text(posts[index]['title'], style: TextStyle(fontWeight: FontWeight.bold),),// sob gula product er title dekhabe
              subtitle: Text(posts[index]['description']),
            ),
          );
      },
      )
    );
  }
}
