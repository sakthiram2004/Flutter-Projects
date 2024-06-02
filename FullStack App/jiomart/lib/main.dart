import 'package:flutter/material.dart';
import 'package:jiomart/screens/Categories/Categorymainpage.dart';
import 'package:jiomart/screens/Home/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryMainPage(),
      // home: Container(
      //   color: Colors.white,
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   child: Row(
      //     children: [
      //       Container(
      //         height: MediaQuery.of(context).size.height,
      //         width: 130.0,
      //         child: Column(
      //           children: [
      //             CircleAvatar(
      //               backgroundColor: Colors.amber,
      //             )
      //           ],
      //         ),
      //       ),
      //       VerticalDivider(
      //         thickness: 1,
      //       ),
      //       Container(
      //           child: Column(
      //         children: [Text("data"), Text("data")],
      //       ))
      //     ],
      //   ),
      // ),
    );
  }
}
