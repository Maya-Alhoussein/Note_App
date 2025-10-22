import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/core/hive_initializer.dart';
import 'package:note_app_final/features/on_boarding/on_boarding_screen.dart';
import 'data/models/note/note.dart';
import 'features/home/home_view_model.dart';
import 'features/add_note/add_note_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.initAndRegisterAdapters();
  await Hive.openBox<Note>('notesBox');
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeViewModel()),
          ChangeNotifierProvider(create: (context) => AddNoteViewModel()),
        ],
        child: const MyApp(),
      ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: OnBoardingScreen(),
        );
      },
    );
  }
}
