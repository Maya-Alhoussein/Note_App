import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/core/hive_initializer.dart';
import 'package:note_app_final/core/language_provider.dart';
import 'package:note_app_final/features/on_boarding/on_boarding_screen.dart';
import 'package:note_app_final/l10n/app_localizations.dart';
import 'core/repo_initializer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.initAndRegisterAdapters();
  await RepositoryInitializer.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
          child: Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: languageProvider.currentLocale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', ''), // English
                  Locale('ar', ''), // Arabic
                ],
                home: OnBoardingScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
