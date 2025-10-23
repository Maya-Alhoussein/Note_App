// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'أضف ملاحظاتك';

  @override
  String get home => 'الرئيسية';

  @override
  String get changeLanguage => ' اللغة';

  @override
  String get deleteAllNotes => 'حذف جميع الملاحظات';

  @override
  String get deleteAllNotesTitle => 'حذف جميع الملاحظات';

  @override
  String get deleteAllNotesMessage =>
      'هل أنت متأكد من أنك تريد حذف جميع الملاحظات؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get cancel => 'إلغاء';

  @override
  String get deleteAll => 'حذف الكل';

  @override
  String get deleteNote => 'حذف الملاحظة';

  @override
  String get deleteNoteMessage => 'هل أنت متأكد من أنك تريد حذف هذه الملاحظة؟';

  @override
  String get delete => 'حذف';

  @override
  String get allNotesDeletedSuccessfully => 'تم حذف جميع الملاحظات بنجاح';

  @override
  String errorDeletingNotes(Object error) {
    return 'خطأ في حذف الملاحظات: $error';
  }

  @override
  String get noNotesYet =>
      'لا توجد ملاحظات بعد. اضغط على \"+\" لإضافة ملاحظتك الأولى!';

  @override
  String get hello => 'مرحباً 👋';

  @override
  String get searchNotes => 'البحث في الملاحظات...';

  @override
  String get noSearchResults => 'لم يتم العثور على ملاحظات تطابق بحثك';

  @override
  String get searchHint => 'ابحث في الملاحظات...';
}
