import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Myapp()));

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Id Card"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg'),
                radius: 40.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Name',
              style: TextStyle(letterSpacing: 1.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Simren',
              style: TextStyle(fontSize: 20.0, color: Colors.red),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('Current Level'),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '2',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.red,
                ),
                Text('simren@gmail.com'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
