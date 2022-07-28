import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Patch extends StatefulWidget {
  const Patch({Key? key}) : super(key: key);

  @override
  State<Patch> createState() => _PatchState();
}

class _PatchState extends State<Patch> {
  void pacthData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts/1';

    var response = await http.patch(Uri.parse(url), body: {
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
        title: const Text('PATCH'),
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
            ElevatedButton(onPressed: pacthData, child: const Text('Patch'))
          ],
        ),
        ),
      )
    );
  }
}
