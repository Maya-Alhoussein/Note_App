import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app_final/features/home/home_view_model.dart';
import 'package:note_app_final/features/home/widgets/note_card.dart';
import 'package:provider/provider.dart';
class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final notes = viewModel.notes;

    if (notes.isEmpty) {
      ///todo : make emptyWidget
      return const Center(
        child: Text(
          'No notes yet. Tap the "+" to add your first note!',
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      );
    }

    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: notes.asMap().entries.map((entry) {
        final index = entry.key;
        final note = entry.value;
        return StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: note.heightRatio,
          child: Dismissible(
            key: Key('note_${index}_${note.title}_${note.content.hashCode}'),
            direction: DismissDirection.horizontal,
            background: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(
                Icons.delete,
                color: Colors.grey,
                size: 30,
              ),
            ),
            secondaryBackground: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.delete,
                color: Colors.grey,
                size: 30,
              ),
            ),
            confirmDismiss: (direction) async {
              // Show confirmation dialog
              return await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete Note'),
                    content: const Text('Are you sure you want to delete this note?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Delete'),
                        style: TextButton.styleFrom(foregroundColor: Colors.red),
                      ),
                    ],
                  );
                },
              );
            },
            onDismissed: (direction) {
              // Delete the note
              final homeViewModel = context.read<HomeViewModel>();
              homeViewModel.deleteNote(note);
            },
            child: SizedBox.expand(
              child: NoteCard(note: note),
            ),
          ),
        );
      }).toList(),
    );
  }
}
