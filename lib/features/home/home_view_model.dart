import 'package:flutter/material.dart';
import 'package:note_app_final/models/note/note.dart';

class HomeViewModel extends ChangeNotifier{
  final List<Note> mockNotes = [
    Note(
      title: 'Today\'s Tasks',
      content:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
      colorValue: Colors.lightGreen.shade200,
      heightRatio: 1.0,
    ),
    Note(
      title: 'Shopping List',
      content:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. deserunt mollit anim id est laborum.',
      colorValue: Colors.deepPurple.shade200,
      heightRatio: 1.8,
    ),
    Note(
      title: 'Trend Lists',
      content:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
      colorValue: Colors.pink.shade200,
      heightRatio: 1.3,
    ),
    Note(
      title: 'Homework',
      content:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. deserunt mollit anim id est laborum.',
      colorValue: Colors.yellow.shade200,
      heightRatio: 2.0,
    ),
    Note(
      title: 'Social Posts',
      content:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
      colorValue: Colors.cyan.shade200,
      heightRatio: 1.5,
    ),
    Note(
      title: 'Workout',
      content:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
      colorValue: Colors.purple.shade200,
      heightRatio: 1.0,
    ),
  ];
}