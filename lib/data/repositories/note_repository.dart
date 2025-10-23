import 'dart:async';
import 'package:note_app_final/data/models/note/note.dart';
import 'package:note_app_final/core/storage/hive_utils.dart';
import 'package:note_app_final/common_imports.dart';

class NoteRepository with HiveRepositoryMixin<Note> {
  static const String _notesBoxName = 'notesBox';
  final ValueNotifier<List<Note>> notesNotifier = ValueNotifier([]);

  static final NoteRepository _instance = NoteRepository._internal();
  factory NoteRepository() => _instance;
  NoteRepository._internal();

  @override
  String get boxName => _notesBoxName;

  Future<void> init() async {
    await initBox();
    notesNotifier.value = getAllItems();
    box.watch().listen((event) {
      notesNotifier.value = getAllItems();
    });
  }

  List<Note> getNotes() => getAllItems();

  Future<void> addNote(Note note) async {
    await addItem(note);
  }

  Future<void> updateNote(int index, Note updatedNote) async {
    await updateItemAt(index, updatedNote);
  }

  Future<void> deleteNote(Note note) async {
    final index = getAllItems().indexOf(note);
    if (index != -1) {
      await deleteItemAt(index);
    }
  }

  Future<void> deleteAllNotes() async {
    await clearAllItems();
  }

  // Cleanup
  void dispose() {
    notesNotifier.dispose();
    closeBox();
  }
}