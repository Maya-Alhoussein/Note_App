import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/data/models/note/note.dart';
import 'package:note_app_final/features/home/home_view_model.dart';
import 'package:note_app_final/features/home/widgets/note_card.dart';
import 'package:note_app_final/features/home/widgets/empty_state_widget.dart';
import 'package:note_app_final/l10n/app_localizations.dart';
class NotesList extends StatelessWidget {
  final List<Note> notes;
  const NotesList({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return const EmptyStateWidget();
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
              final l10n = AppLocalizations.of(context)!;
              return await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(l10n.deleteNote),
                    content: Text(l10n.deleteNoteMessage),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text(l10n.cancel),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text(l10n.delete),
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
