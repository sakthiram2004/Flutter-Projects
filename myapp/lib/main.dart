import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyAppp"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
      //   child: Image(
      //     image:NetworkImage('https://img.freepik.com/free-photo/golden-frame-blue-background_53876-92990.jpg?w=360&t=st=1715512626~exp=1715513226~hmac=8ebb8d4e69b21fbf680836921414a4411f74897c825c357d79d84efa41e001c8'),
      //// ),
      
       
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Text('click me'),
      //   onPressed: () => {},
      //   backgroundColor: Colors.blue,
      // ),
    );
  }
}
