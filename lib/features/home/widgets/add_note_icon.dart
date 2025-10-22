import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/features/add_note/add_note_screen.dart';

class AddNoteIcon extends StatelessWidget {
  const AddNoteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}