import 'package:care_tutor_note_taking_app/controllers/note_controller.dart';
import 'package:care_tutor_note_taking_app/models/note_model.dart';
import 'package:get/get.dart';

class NotesProvider extends GetxController {
  final NotesController _controller = NotesController();

  var notes = <NoteModel>[].obs;
  var isLoading = true.obs;

  void fetchNotes(String userId) {
    isLoading.value = true;
    _controller.getNotes(userId).listen((notesList) {
      notes.value = notesList;
      isLoading.value = false;
    }, onError: (e) {
      isLoading.value = false;
      print('Error fetching notes: $e');
    });
  }

  Future<void> addNote(String userId, String title, String content) async {
    isLoading.value = true;
    await _controller.addNote(userId, title, content);
    isLoading.value = false;
  }

  Future<void> updateNote(String docId, String title, String content) async {
    isLoading.value = true;
    await _controller.updateNote(docId, title, content);
    isLoading.value = false;
  }

  Future<void> deleteNote(String docId) async {
    isLoading.value = true;
    await _controller.deleteNote(docId);
    isLoading.value = false;
  }
}
