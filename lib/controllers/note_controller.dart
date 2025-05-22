import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class NotesController {
  Future<void> addNote(String title, String content) async {
    try {
      await firestore.collection('notes').add({
        'title': title,
        'content': content,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Note added successfully.');
    } catch (e) {
      print('Error adding note: $e');
    }
  }

Stream<List<Map<String, dynamic>>> getNotes() {
  return firestore
      .collection('notes')
      .orderBy('timestamp', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            final rawTimestamp = data['timestamp'];
            String formattedTimestamp;

            if (rawTimestamp is Timestamp) {
              formattedTimestamp = rawTimestamp.toDate().toString();
            } else if (rawTimestamp is String) {
              try {
                formattedTimestamp = DateTime.parse(rawTimestamp).toString();
              } catch (e) {
                formattedTimestamp = 'Invalid date';
              }
            } else {
              formattedTimestamp = 'No timestamp';
            }

            return {
              'id': doc.id,
              'title': data['title'],
              'content': data['content'],
              'timestamp': formattedTimestamp,
            };
          }).toList());
}



  Future<void> updateNote(String docId, String title, String content) async {
    try {
      await firestore.collection('notes').doc(docId).update({
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
      await firestore.collection('notes').doc(docId).delete();
      print('Note deleted successfully.');
    } catch (e) {
      print('Error deleting note: $e');
    }
  }
}
