import 'package:note_app_final/data/models/note/note.dart';
import 'package:note_app_final/data/repositories/note_repository.dart';
import 'package:note_app_final/common_imports.dart';

class AddNoteViewModel extends ChangeNotifier {
  final NoteRepository _noteRepository;
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

  AddNoteViewModel(this._noteRepository);

  void selectColor(Color color) {
    if (_selectedColor != color) {
      _selectedColor = color;
      notifyListeners();
    }
  }

  Future<bool> saveNewNote({
    required String title,
    required String content,
    BuildContext? context,
  }) async {
    final trimmedTitle = title.trim();
    final trimmedContent = content.trim();

    if (trimmedTitle.isEmpty || trimmedContent.isEmpty) {
      return false;
    }

    await addNote(
      title: trimmedTitle,
      content: trimmedContent,
      color: _selectedColor,
    );

    return true;
  }

  Future<void> addNote({
    required String title,
    required String content,
    required Color color,
  }) async {
    final newNote = Note.create(
      title: title,
      content: content,
      color: color,
      heightRatio: 1.0,
    );
    await _noteRepository.addNote(newNote);  // Delegate to repository
  }
}