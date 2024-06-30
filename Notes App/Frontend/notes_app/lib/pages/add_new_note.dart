import 'package:flutter/material.dart';
import 'package:notes_app/models/Node.dart';
import 'package:notes_app/provider/notes_provider.dart';
import 'package:notes_app/service/ApiService.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNewNotePage extends StatefulWidget {
  final bool isupdate;
  final Note? note;
  const AddNewNotePage({Key? key, required this.isupdate, required this.note})
      : super(key: key);

  @override
  State<AddNewNotePage> createState() => _AddNewNotePageState();
}

class _AddNewNotePageState extends State<AddNewNotePage> {
  TextEditingController titlecontroller = new TextEditingController();
  TextEditingController notecontroller = new TextEditingController();
  void addNewNote() {
    Note newNote = Note(
        id: const Uuid().v1(),
        userid: "murugan@gmail.com",
        title: titlecontroller.text,
        content: notecontroller.text,
        dateadded: DateTime.now());
    ApiService.addNote(newNote);
    Provider.of<NotesProvider>(context, listen: false).addNote(newNote);
    Navigator.pop(context);
  }

  void updateNote() {
    widget.note!.title = titlecontroller.text;
    widget.note!.content = notecontroller.text;
    Provider.of<NotesProvider>(context, listen: false).updateNote(widget.note!);
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isupdate) {
      titlecontroller.text = widget.note!.title!;
      notecontroller.text = widget.note!.content!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                if (widget.isupdate) {
                  updateNote();
                } else {
                  addNewNote();
                }
              },
              icon: Icon(Icons.check))
        ],
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextField(
                controller: titlecontroller,
                style: TextStyle(
                  fontSize: 30,
                ),
                decoration: InputDecoration(
                    hintText: "Title", border: InputBorder.none),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: notecontroller,
                maxLines: null,
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration:
                    InputDecoration(hintText: "Note", border: InputBorder.none),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
