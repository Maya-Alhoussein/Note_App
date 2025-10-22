import 'package:note_app_final/features/add_note/add_note_view_model.dart';
import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/features/add_note/widgets/color_picker.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveNoteHandler() async {
    final viewModel = context.read<AddNoteViewModel>();
    final success = await viewModel.saveNewNote(
      title: _titleController.text,
      content: _contentController.text,
      context: context,
    );
    if (success) {
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title and content cannot be empty.')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddNoteViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('New Note'),
        backgroundColor: viewModel.selectedColor,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.check, size: 28.w),
            onPressed: _saveNoteHandler,
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            // Title Input
            TextFormField(
              controller: _titleController,
              autofocus: true,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),

            SizedBox(height: 10.h),
            //title Input
            Expanded(
              child: TextFormField(
                controller: _contentController,
                maxLines: null, // Allows multiline input
                keyboardType: TextInputType.multiline,
                style: TextStyle(fontSize: 18.sp, color: Colors.black87),
                decoration: const InputDecoration(
                  hintText: 'Start writing your note...',
                  border: InputBorder.none,
                ),
              ),
            ),

            ColorPickerWidget(
              selectedColor: viewModel.selectedColor,
              onColorSelected: viewModel.selectColor,
              availableColors: viewModel.availableColors,
            ),
          ],
        ),
      ),
    );
  }
}
