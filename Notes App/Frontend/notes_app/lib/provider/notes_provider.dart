import 'package:flutter/material.dart';
import 'package:notes_app/models/Node.dart';
import 'package:notes_app/service/ApiService.dart';

class NotesProvider with ChangeNotifier {
  NotesProvider() {
    fetchNotes();
  }
  List<Note> notes = [];
  void addNote(Note note) {
    notes.add(note);
    notifyListeners();
  }

  void updateNote(Note note) {
    int index =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[index] = note;
    notifyListeners();
    ApiService.addNote(note);
  }

  void deleteNote(Note note) {
    int index =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(index);
    notifyListeners();
    ApiService.deleteNote(note);
  }

  void fetchNotes() async {
    List<Note> fetchnotes = await ApiService.fetchNotes("murugan");
    notifyListeners();
  }
}
