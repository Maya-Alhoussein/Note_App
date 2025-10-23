import 'dart:async';
import 'package:note_app_final/data/models/note/note.dart';
import 'package:note_app_final/data/repositories/note_repository.dart';
import 'package:note_app_final/common_imports.dart';

class HomeViewModel extends ChangeNotifier {
  final NoteRepository _repository;
  VoidCallback? _listener;

  ValueNotifier<List<Note>> get notesNotifier => _repository.notesNotifier;


  HomeViewModel(this._repository) {
    _init();
  }

  List<Note> get notes => _repository.getNotes();

  Future<void> deleteNote(Note note) async {
    await _repository.deleteNote(note);
  }

  Future<void> deleteAllNotes() async {
    await _repository.deleteAllNotes();
  }

  void _init() {
    _listener = () => notifyListeners();
    _repository.notesNotifier.addListener(_listener!);
  }

  @override
  void dispose() {
    if (_listener != null) _repository.notesNotifier.removeListener(_listener!);
    super.dispose();
  }
}
