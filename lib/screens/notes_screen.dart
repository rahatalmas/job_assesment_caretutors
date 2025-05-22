import 'package:care_tutor_note_taking_app/providers/notes_provider.dart';
import 'package:care_tutor_note_taking_app/widgets/note.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key, required this.title});
  final String title;

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final NotesProvider _notesProvider = Get.find<NotesProvider>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_notesProvider.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (_notesProvider.notes.isEmpty) {
        return const Center(child: Text("No notes found."));
      }
     return ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 0),
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.list
                          ),
                          Text("note list")
                        ],
                      ),
                      Row(
                        children: [
                          Text("All"),
                          Icon(
                            Icons.arrow_drop_down
                          ),
                        ],
                      ),
                  ],),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _notesProvider.notes.length,
                    itemBuilder: (BuildContext context, int index) {
                      var note = _notesProvider.notes[index];
                      final String formattedTime = note.timestamp != null
                      ? DateFormat('yyyy-MM-dd HH:mm').format(note.timestamp!)
                      : 'No date';
                      return Note(
                        index: note.id,
                        title: note.title,
                        content: note.content,
                        createdAt: formattedTime,
                      );},
                  )
                ],
              );
    });
  }
}
