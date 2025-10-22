import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/features/add_note/add_note_screen.dart';
import 'package:note_app_final/features/home/widgets/notes_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your Notes'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.menu, color: Colors.black38, size: 25.w),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.search, color: Colors.black38, size: 25.sp),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: NotesList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(),
            ),
          );
        },
        backgroundColor: const Color(0xFFE57373), // Red color from screenshot
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
