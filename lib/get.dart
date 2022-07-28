import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Get extends StatefulWidget {
  const Get({ Key? key }) : super(key: key);

  @override
  State<Get> createState() => _GetState();
}

class _GetState extends State<Get> {

  String body = "No Data";

  void getData() async {
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/2'));

    Map<String, dynamic> data = jsonDecode(response.body);

    setState(() {
      body = data.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GET'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(body),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: getData, child: const Text('Get'))
          ],
        ),

      ),
    );
  }
}