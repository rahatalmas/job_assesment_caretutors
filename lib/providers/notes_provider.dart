import 'package:care_tutor_note_taking_app/controllers/note_controller.dart';
import 'package:get/get.dart';


class NotesProvider extends GetxController {
  final NotesController _controller = NotesController();

  var notes = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  void fetchNotes() {
    isLoading.value = true;

    _controller.getNotes().listen((notesList) {
      notes.value = notesList;
      isLoading.value = false;
    }, onError: (e) {
      isLoading.value = false;
      print('Error fetching notes: $e');
    });
  }

  Future<void> addNote(String title, String content) async {
    isLoading.value = true;
    await _controller.addNote(title, content);
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

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }
}
