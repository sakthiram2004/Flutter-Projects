import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/Node.dart';
import 'package:notes_app/pages/add_new_note.dart';
import 'package:notes_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NotesProvider notesProvider = Provider.of<NotesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(" Notes App"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: notesProvider.notes.length,
              itemBuilder: (context, index) {
                Note currentNode = notesProvider.notes[index];

                return GestureDetector(
                  onTap: ()=>{
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=> AddNewNotePage(isupdate: true, note: currentNode,)))
                  },
                  onLongPress: ()=>{
                    notesProvider.deleteNote(currentNode)
                  },
                  child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            currentNode.title!,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            currentNode.content!,
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => AddNewNotePage(isupdate: false, note: null,)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
