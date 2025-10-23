import 'dart:io';
import 'package:note_app_final/core/storage/hive_registrar.g.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveInitializer {
  static const String _hiveDirectoryName = 'hive_databases';
  
  static Future<void> initAndRegisterAdapters() async {
    final appDir = await getApplicationSupportDirectory();
    final hiveDir = Directory('${appDir.path}/$_hiveDirectoryName');

    if (!await hiveDir.exists()) {
      await hiveDir.create(recursive: true);
    }

    final path = hiveDir.path;

    Hive
      ..init(path)
      ..registerAdapters();
  }
}
