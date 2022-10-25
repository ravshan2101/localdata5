// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:localdata5/model/post.dart';
import 'package:localdata5/servic/http_servic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String data;

  void apiPostlist() {
    Network.GET(Network.API_LIST, Network.paramsEmpty())
        .then((response) => {print(response), _showResponse(response!)});
  }

  void apiCretepost(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {print(response), _showResponse(response!)});
  }

  void apiUpdatapost(Post post) {
    Network.PUT(
            Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {print(response), _showResponse(response!)});
  }

  void apiDeletpost(Post post) {
    Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty())
        .then((response) => {print(response), _showResponse(response!)});
  }

  @override
  void initState() {
    super.initState();
    apiPostlist();
    var post = Post(id: 1, title: 'pdp', body: 'online', userId: 1);
    apiDeletpost(post);
  }

  void _showResponse(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text(data != null ? data : "No Data")),
      ),
    );
  }
}
