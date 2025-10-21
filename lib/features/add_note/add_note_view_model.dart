import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:note_app_final/data/models/note/note.dart';

class AddNoteViewModel extends ChangeNotifier {
  late Box<Note> _notesBox;
  Color _selectedColor = Colors.lightBlue.shade200;
  Color get selectedColor => _selectedColor;

  final List<Color> availableColors = [
    Colors.lightBlue.shade200,
    Colors.pink.shade200,
    Colors.lightGreen.shade200,
    Colors.yellow.shade200,
    Colors.purple.shade200,
    Colors.cyan.shade200,
  ];

  AddNoteViewModel() {
    _notesBox = Hive.box<Note>('notesBox');
  }

  void selectColor(Color color) {
    if (_selectedColor != color) {
      _selectedColor = color;
      notifyListeners();
    }
  }

  bool saveNewNote({
    required String title,
    required String content,
  }) {
    final trimmedTitle = title.trim();
    final trimmedContent = content.trim();

    if (trimmedTitle.isEmpty || trimmedContent.isEmpty) {
      return false;
    }

    addNote(
      title: trimmedTitle,
      content: trimmedContent,
      color: _selectedColor,
    );

    return true;
  }

  void addNote({
    required String title,
    required String content,
    required Color color,
  }) {
    final newNote = Note.create(
      title: title,
      content: content,
      color: color,
      heightRatio: 1.0,
    );
    _notesBox.add(newNote);

  }
}