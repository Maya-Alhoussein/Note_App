import 'dart:async';
import 'package:note_app_final/data/models/note/note.dart';
import 'package:note_app_final/common_imports.dart';

class NoteRepository {
  static const String _notesBoxName = 'notesBox';
  late Box<Note> _notesBox;
  final ValueNotifier<List<Note>> notesNotifier = ValueNotifier([]);

  static final NoteRepository _instance = NoteRepository._internal();
  factory NoteRepository() => _instance;
  NoteRepository._internal();

  Future<void> init() async {
    _notesBox = await Hive.openBox<Note>(_notesBoxName);
    notesNotifier.value = _notesBox.values.toList();
    _notesBox.watch().listen((event) {
      notesNotifier.value = _notesBox.values.toList();
    });
  }

  List<Note> getNotes() => _notesBox.values.toList();

  Future<void> addNote(Note note) async {
    try {
      await _notesBox.add(note);
      await _notesBox.flush();
    } catch (e) {
      throw Exception('Failed to add note: $e');
    }
  }

  Future<void> updateNote(int index, Note updatedNote) async {
    try {
      await _notesBox.putAt(index, updatedNote);
    } catch (e) {
      throw Exception('Failed to update note: $e');
    }
  }

  Future<void> deleteNote(Note note) async {
    try {
      final index = _notesBox.values.toList().indexOf(note);
      if (index != -1) {
        await _notesBox.deleteAt(index);
        await _notesBox.flush();
      }
    } catch (e) {
      throw Exception('Failed to delete note: $e');
    }
  }

  Future<void> deleteAllNotes() async {
    try {
      await _notesBox.clear();
      await _notesBox.flush();
    } catch (e) {
      throw Exception('Failed to delete all notes: $e');
    }
  }

  // Cleanup
  void dispose() {
    notesNotifier.dispose();
  }
}