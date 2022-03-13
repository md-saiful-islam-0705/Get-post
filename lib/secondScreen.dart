import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sensors/main.dart';



class secondScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<secondScreen>{
  final url = "https://jsonplaceholder.typicode.com/posts";
  var _postsJson = [];
  void fetchPosts() async{
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState((){
        _postsJson = jsonData;
      });
    } catch(err) {

    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Posts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ListView.builder(
            itemCount: _postsJson.length,
            itemBuilder: (context, i){
              final post = _postsJson[i];
              return     Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.purpleAccent, // Set border color
                        width: 3.0),   // Set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // Set rounded corner radius
                    boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
                ),
                child: Text (( "Title: ${post["title"]}\n Body: ${post["body"]}\n\n" )),
              );

            }
        ),
      ),

    );
  }
}

