import 'package:note_app_final/common_imports.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en', '');
  
  Locale get currentLocale => _currentLocale;
  
  void setLocale(Locale locale) {
    if (_currentLocale != locale) {
      _currentLocale = locale;
      notifyListeners();
    }
  }
  
  void toggleLanguage() {
    _currentLocale = _currentLocale.languageCode == 'en' 
        ? const Locale('ar', '') 
        : const Locale('en', '');
    notifyListeners();
  }
  
  String get currentLanguageName {
    return _currentLocale.languageCode == 'en' ? 'English' : 'العربية';
  }
}
