import 'package:note_app_final/data/models/note/note.dart';
import 'package:note_app_final/common_imports.dart';


class HomeViewModel extends ChangeNotifier{
  late Box<Note> _notesBox;
  bool _isInitialized = false;

  HomeViewModel() {
    _init();
  }

  List<Note> get notes => _isInitialized ? _notesBox.values.toList() : [];

  Future<void> _init() async {
    if (!Hive.isBoxOpen('notesBox')) {
      _notesBox = await Hive.openBox<Note>('notesBox');
    } else {
      _notesBox = Hive.box<Note>('notesBox');
    }
    _notesBox.listenable().addListener(notifyListeners);

    _isInitialized = true;
    notifyListeners();
  }


  @override
  void dispose() {
    // Check if box is initialized before removing listener
    if (Hive.isBoxOpen('notesBox')) {
      _notesBox.listenable().removeListener(notifyListeners);
    }
    super.dispose();
  }
}