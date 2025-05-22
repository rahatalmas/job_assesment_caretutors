import 'package:care_tutor_note_taking_app/providers/notes_provider.dart';
import 'package:care_tutor_note_taking_app/widgets/note.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool login = true;
  final NotesProvider _notesProvider = Get.put(NotesProvider());
  @override
  Widget build(BuildContext context) {
    return  ListView(
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
                      return Note(
                        index: note['id'],
                        title: note['title'],
                        content: note['content'],
                        createdAt: DateTime.now(),
                      );},
                  )
                ],
              );
  }
}
