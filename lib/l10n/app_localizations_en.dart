// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Add your Notes';

  @override
  String get home => 'Home';

  @override
  String get changeLanguage => 'Language';

  @override
  String get deleteAllNotes => 'Delete All Notes';

  @override
  String get deleteAllNotesTitle => 'Delete All Notes';

  @override
  String get deleteAllNotesMessage =>
      'Are you sure you want to delete all notes? This action cannot be undone.';

  @override
  String get cancel => 'Cancel';

  @override
  String get deleteAll => 'Delete All';

  @override
  String get deleteNote => 'Delete Note';

  @override
  String get deleteNoteMessage => 'Are you sure you want to delete this note?';

  @override
  String get delete => 'Delete';

  @override
  String get allNotesDeletedSuccessfully => 'All notes deleted successfully';

  @override
  String errorDeletingNotes(Object error) {
    return 'Error deleting notes: $error';
  }

  @override
  String get noNotesYet =>
      'No notes yet. Tap the \"+\" to add your first note!';

  @override
  String get hello => 'Hello 👋';
}
