import 'package:care_tutor_note_taking_app/models/note_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class NotesController {
  final CollectionReference notesRef = firestore.collection('notes');

  Future<void> addNote(String userId, String title, String content) async {
    try {
      final note = {
        'userId': userId,
        'title': title,
        'content': content,
        'timestamp': FieldValue.serverTimestamp(),
      };

      await notesRef.add(note);
      print('Note added successfully.');
    } catch (e) {
      print('Error adding note: $e');
    }
  }

  Stream<List<NoteModel>> getNotes(String userId) {
    print("UESR ID $userId");
    return notesRef
        .where('userId', isEqualTo: userId)
        //.orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => NoteModel.fromDocument(doc)).toList());
  }

  Future<void> updateNote(String docId, String title, String content) async {
    try {
      await notesRef.doc(docId).update({
        'title': title,
        'content': content,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Note updated successfully.');
    } catch (e) {
      print('Error updating note: $e');
    }
  }

  Future<void> deleteNote(String docId) async {
    try {
      await notesRef.doc(docId).delete();
      print('Note deleted successfully.');
    } catch (e) {
      print('Error deleting note: $e');
    }
  }
}
