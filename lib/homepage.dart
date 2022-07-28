import 'package:crud_aplication/post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'patch.dart';
import 'put.dart';
import 'get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CRUD'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Get()));
                },
                child: const Text('GET')),
            const SizedBox(
              height: 20,
            ),    
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Post()));
                },
                child: const Text('POST')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Patch()));
                },
                child: const Text('PATCH')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Put()));
                },
                child: const Text('PUT')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  var response = await http.delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

                  print(response.statusCode);
                  print(response.body);
                },
                child: const Text('DELETE')),
          ]),
        ));
  }
}
