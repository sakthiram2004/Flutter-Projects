import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/pages/CatogeryList.dart';
import 'package:todoapp/pages/Home.dart';
 // Assuming this is the correct path

class FirstPage1 extends StatefulWidget {
  const FirstPage1({super.key});

  @override
  State<FirstPage1> createState() => _FirstPage1State();
}

class _FirstPage1State extends State<FirstPage1> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Today's Schedule",
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.red,
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            label: 'Settings',
          ),
        ],
      ),
      body: Column(
        children: [
          Todocarditem(
            title: "Wake up bro",
            time: "10pm",
          ),
          Todocarditem(
            title: "Let's Gym",
            time: "11pm",
          ),
          Todocarditem(
            title: "Buy Some Food",
            time: "12pm",
          ),
          Todocarditem(
            title: "Testing Something",
            time: "1pm",
          ),
        ],
      ),
    );
  }
}
