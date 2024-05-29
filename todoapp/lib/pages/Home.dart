import 'package:flutter/material.dart';
import 'package:todoapp/pages/FirstPage.dart';
import 'package:todoapp/service/AuthService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String task = "";
  String category = "";
  TextEditingController tst = TextEditingController();
  TextEditingController description = TextEditingController();
  Color importantButtonColor = Colors.blue;
  Color plannedButtonColor = Colors.blue;
  Color catplannedButtonColor = Colors.grey;
  Color catimportantButtonColor = Colors.red;
  final AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.0),
                InkWell(
                  onTap: () => {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (builder) => FirstPage1()),
                      (route) => false,
                    ),
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Create",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                SizedBox(height: 5.0),
                Text(
                  "New Todo",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Task Title",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.grey[800],
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: tst,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Task Title",
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          task = "important";
                          importantButtonColor = Colors.grey;
                          plannedButtonColor = Colors.blue;
                        });
                      },
                      child: Text(
                        "Important",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.white,
                        backgroundColor: importantButtonColor,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          task = "planned";
                          plannedButtonColor = Colors.grey;
                          importantButtonColor = Colors.blue;
                        });
                      },
                      child: Text(
                        "Planned",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: plannedButtonColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  "Description",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 150.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.grey[800]),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: description,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Description",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Category",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          category = "Food";
                          catplannedButtonColor = Colors.grey;
                          catimportantButtonColor = Colors.grey;
                        });
                      },
                      child: Text(
                        "Food",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.white,
                        backgroundColor: Colors.red[400],
                      ),
                    ),
                    SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          category = "Workout";
                          catplannedButtonColor = Colors.grey;
                          catimportantButtonColor = Colors.grey;
                        });
                      },
                      child: Text(
                        "Workout",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          category = "Work";
                          catplannedButtonColor = Colors.grey;
                          catimportantButtonColor = Colors.grey;
                        });
                      },
                      child: Text(
                        "Work",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          category = "Design";
                          catplannedButtonColor = Colors.grey;
                          catimportantButtonColor = Colors.grey;
                        });
                      },
                      child: Text(
                        "Design",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          category = "Run";
                          catplannedButtonColor = Colors.grey;
                          catimportantButtonColor = Colors.grey;
                        });
                      },
                      child: Text(
                        "Run",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 110.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: InkWell(
                      onTap: () {
                        FirebaseFirestore.instance.collection("ToDo").add({
                          "title": tst.text,
                          "task": task,
                          "category": category,
                          "description": description.text
                        });
                      },
                      child: Text(
                        "Add Todo",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
