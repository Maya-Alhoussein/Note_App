import 'dart:async';
import 'package:note_app_final/data/models/note/note.dart';
import 'package:note_app_final/data/repositories/note_repository.dart';
import 'package:note_app_final/core/language_provider.dart';
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

  void toggleLanguage(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    languageProvider.toggleLanguage();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(languageProvider.currentLocale.languageCode == 'en' 
            ? 'Language changed to English' 
            : 'تم تغيير اللغة إلى العربية'),
      ),
    );
  }

  Future<void> deleteAllNotesWithFeedback(BuildContext context) async {
    try {
      await deleteAllNotes();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('All notes deleted successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting notes: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
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
