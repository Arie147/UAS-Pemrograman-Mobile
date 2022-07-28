import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Put extends StatefulWidget {
  const Put({Key? key}) : super(key: key);

  @override
  State<Put> createState() => _PutState();
}

class _PutState extends State<Put> {
  void putData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts/1';

    var response = await http.put(Uri.parse(url), body: {
      'userId' : '1',
      'title' : title.text,
      'body' : body.text,
    });

    print(response.body);
  }

  var title = TextEditingController();
  var body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PUT'),
      ),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: title,
            decoration: const InputDecoration(hintText: 'Title'),),
            TextField(controller: body,
            decoration: const InputDecoration(hintText: 'Body'),),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: putData, child: const Text('Put'))
          ],
        ),
        ),
      )
    );
  }
}
