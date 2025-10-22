import 'package:note_app_final/data/models/note/note.dart';
import 'package:note_app_final/common_imports.dart';


class HomeViewModel extends ChangeNotifier{
  late Box<Note> _notesBox;
  bool _isInitialized = false;

  HomeViewModel() {
    _init();
  }

  List<Note> get notes {
    if (!_isInitialized) return [];
    final notesList = _notesBox.values.toList();
    print('HomeViewModel: Getting ${notesList.length} notes');
    return notesList;
  }

  void refreshNotes() {
    if (_isInitialized) {
      // Ensure we have the latest data from Hive
      _notesBox = Hive.box<Note>('notesBox');
      print('HomeViewModel: Refreshing notes, current count: ${_notesBox.length}');
      // Force a refresh by calling notifyListeners
      notifyListeners();
    }
  }

  Future<void> deleteNote(Note note) async {
    if (_isInitialized) {
      try {
        // Find the note by its key in the box
        final noteKey = _notesBox.keyAt(_notesBox.values.toList().indexOf(note));
        if (noteKey != null) {
          await _notesBox.delete(noteKey);
          print('HomeViewModel: Note deleted successfully');
          notifyListeners();
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
      notifyListeners();
    } catch (e) {
      print('Error initializing HomeViewModel: $e');
      _isInitialized = false;
    }
  }


  @override
  void dispose() {
    super.dispose();
  }
}