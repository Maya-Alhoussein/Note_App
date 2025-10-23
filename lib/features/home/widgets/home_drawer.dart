import 'package:lottie/lottie.dart';
import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/features/home/home_view_model.dart';

class HomeDrawer extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeDrawer({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300.w,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        children: [
          Column(
            children: [
              Lottie.asset(
                'assets/lottie/sticky_note.json',
                width: 150.w,
                height: 150.h,
                fit: BoxFit.contain,
                repeat: true,
                reverse: false,
                animate: true,
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Change Language'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.restore_from_trash_rounded),
            title: const Text('Delete All Notes'),
            onTap: () {
              _showDeleteAllConfirmation(context, viewModel);
            },
          ),
        ],
      ),
    );
  }

  void _showDeleteAllConfirmation(
    BuildContext context,
    HomeViewModel viewModel,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete All Notes'),
          content: const Text(
            'Are you sure you want to delete all notes? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); 
                try {
                  await viewModel.deleteAllNotes();
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
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Delete All'),
            ),
          ],
        );
      },
    );
  }
}
