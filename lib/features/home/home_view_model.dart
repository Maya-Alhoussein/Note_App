import 'dart:async';
import 'package:note_app_final/data/models/note/note.dart';
import 'package:note_app_final/data/repositories/note_repository.dart';
import 'package:note_app_final/core/language_provider.dart';
import 'package:note_app_final/common_imports.dart';

class HomeViewModel extends ChangeNotifier {
  final NoteRepository _repository;
  VoidCallback? _listener;
  
  // Search functionality
  String _searchQuery = '';
  bool _isSearching = false;
  List<Note> _filteredNotes = [];

  ValueNotifier<List<Note>> get notesNotifier => _repository.notesNotifier;
  
  // Search getters
  String get searchQuery => _searchQuery;
  bool get isSearching => _isSearching;
  List<Note> get filteredNotes => _isSearching ? _filteredNotes : _repository.getNotes();


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
          SnackBar(
            content: Text(AppLocalizations.of(context)?.allNotesDeletedSuccessfully ?? 'All notes deleted successfully'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)?.errorDeletingNotes ?? 'Error deleting notes'}: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  // Search methods
  void startSearch() {
    _isSearching = true;
    notifyListeners();
  }

  void stopSearch() {
    _isSearching = false;
    _searchQuery = '';
    _filteredNotes = [];
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    _filterNotes();
    notifyListeners();
  }

  void _filterNotes() {
    if (_searchQuery.isEmpty) {
      _filteredNotes = _repository.getNotes();
    } else {
      final query = _searchQuery.toLowerCase();
      _filteredNotes = _repository.getNotes().where((note) {
        return note.title.toLowerCase().contains(query) ||
               note.content.toLowerCase().contains(query);
      }).toList();
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
