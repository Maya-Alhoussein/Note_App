import '../data/repositories/note_repository.dart';

class RepositoryInitializer {
  static Future<NoteRepository> initialize() async {
    final noteRepository = NoteRepository();
    await noteRepository.init();
    return noteRepository;
  }
}