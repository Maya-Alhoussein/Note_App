import 'dart:io';
import 'package:note_app_final/hive_registrar.g.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveInitializer {
  static Future<void> initAndRegisterAdapters() async {
    final appDir = await getApplicationSupportDirectory();
    final hiveDir = Directory('${appDir.path}/hive_databases');

    if (!await hiveDir.exists()) {
      await hiveDir.create(recursive: true);
    }

    final path = hiveDir.path;

    Hive
      ..init(path)
      ..registerAdapters();
  }
}
