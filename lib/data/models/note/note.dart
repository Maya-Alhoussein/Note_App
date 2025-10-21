import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@HiveType(typeId: 0)
@freezed
abstract class Note with _$Note {
  const Note._();

  const factory Note({
    @HiveField(0)
    required String title,

    @HiveField(1)
    required String content,

    @HiveField(2)
    required int colorValue,

    @HiveField(3)
    required double heightRatio,
  }) = _Note;

  Color get color => Color(colorValue);

  factory Note.create({
    required String title,
    required String content,
    required Color color,
    required double heightRatio,
  }) {
    return Note(
      title: title,
      content: content,
      colorValue: color.value,
      heightRatio: heightRatio,
    );
  }
}