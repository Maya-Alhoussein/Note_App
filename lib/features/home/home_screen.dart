import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app_final/features/home/home_view_model.dart';
import 'package:note_app_final/features/home/widgets/note_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('Add your Notes'),
          centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black, size: 30),
          onPressed: () {},
        ),
          actions: [
      IconButton(
      icon: const Icon(Icons.search, color: Colors.black, size: 30),
      onPressed: () {},
    ),]
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: StaggeredGrid.count(
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: const Color(0xFFE57373), // Red color from screenshot
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
