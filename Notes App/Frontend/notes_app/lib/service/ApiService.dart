import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notes_app/models/Node.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:3000/notes";

  static Future<void> addNote(Note note) async {
    const String endpoint = "/add";
    Uri reqUri = Uri.parse(baseUrl + endpoint);

    try {
      var response = await http.post(
        reqUri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(note.toMap()),
      );

      if (response.statusCode == 200) {
        var decoder = jsonDecode(response.body);
        print(decoder.toString());
      } else {
        print('Failed to add note: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  static Future<void> deleteNote(Note note) async {
    const String endpoint = "/delete";
    Uri reqUri = Uri.parse(baseUrl + endpoint);

    try {
      var response = await http.post(
        reqUri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(note.toMap()),
      );

      if (response.statusCode == 200) {
        var decoder = jsonDecode(response.body);
        print(decoder.toString());
      } else {
        print('Failed to delete note: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  static Future<List<Note>> fetchNotes(String userId) async {
    const String endpoint = "/list";
    Uri reqUri = Uri.parse(baseUrl + endpoint);

    try {
      var response = await http.post(
        reqUri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'userId': userId}),
      );

      if (response.statusCode == 200) {
        List<dynamic> decoded = jsonDecode(response.body);
        List<Note> notes = decoded.map((json) => Note.fromMap(json)).toList();
        return notes;
      } else {
        print('Failed to fetch notes: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error occurred: $e');
      return [];
    }
  }
}
