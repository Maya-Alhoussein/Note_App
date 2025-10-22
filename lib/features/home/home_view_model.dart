import 'dart:async';

import 'package:note_app_final/data/models/note/note.dart';
import 'package:note_app_final/common_imports.dart';

class HomeViewModel extends ChangeNotifier {
  late Box<Note> _notesBox;
  bool _isInitialized = false;
  final ValueNotifier<List<Note>> notesNotifier = ValueNotifier([]);
  StreamSubscription? _boxSubscription;

  HomeViewModel() {
    _init();
  }

  List<Note> get notes {
    if (!_isInitialized) return [];
    final notesList = _notesBox.values.toList();
    return notesList;
  }

  Future<void> deleteNote(Note note) async {
    if (_isInitialized) {
      try {
        final noteKey = _notesBox.keyAt(
          _notesBox.values.toList().indexOf(note),
        );
        if (noteKey != null) {
          await _notesBox.delete(noteKey);
        }
      } catch (e) {
        print('Error deleting note: $e');
      }
    }
  }

  Future<void> _init() async {
    try {
      if (!Hive.isBoxOpen('notesBox')) {
        _notesBox = await Hive.openBox<Note>('notesBox');
      } else {
        _notesBox = Hive.box<Note>('notesBox');
      }
      _isInitialized = true;
      notesNotifier.value = _notesBox.values.toList();
      _boxSubscription = _notesBox.watch().listen((event) {
        notesNotifier.value = _notesBox.values.toList();
      });
      notifyListeners();
    } catch (e) {
      print('Error initializing HomeViewModel: $e');
      _isInitialized = false;
    }
  }

  @override
  void dispose() {
    _boxSubscription?.cancel(); // Clean up the listener
    notesNotifier.dispose();
    super.dispose();
  }
}
