import 'package:care_tutor_note_taking_app/controllers/note_controller.dart';
import 'package:get/get.dart';

class NotesProvider extends GetxController {
  final NotesController _controller = NotesController();

  var notes = <Map<String, dynamic>>[].obs;

  void fetchNotes() {
    _controller.getNotes().listen((notesList) {
      notes.value = notesList;
    });
  }

  Future<void> addNote(String title, String content) async {
    await _controller.addNote(title, content);
  }

  Future<void> updateNote(String docId, String title, String content) async {
    await _controller.updateNote(docId, title, content);
  }

  Future<void> deleteNote(String docId) async {
    await _controller.deleteNote(docId);
  }

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }
}
