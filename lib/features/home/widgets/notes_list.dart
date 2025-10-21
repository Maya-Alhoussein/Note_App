import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app_final/features/home/home_view_model.dart';
import 'package:note_app_final/features/home/widgets/note_card.dart';
import 'package:provider/provider.dart';
class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: viewModel.mockNotes.map((note) {
        return StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: note.heightRatio,
          child: NoteCard(note: note),
        );
      }).toList(),
    );
  }
}
