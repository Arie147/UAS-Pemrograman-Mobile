import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  void postData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    var response = await http.post(Uri.parse(url), body: {
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
        title: const Text('POST'),
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
            ElevatedButton(onPressed: postData, child: const Text('Post'))
          ],
        ),
        ),
      )
    );
  }
}
