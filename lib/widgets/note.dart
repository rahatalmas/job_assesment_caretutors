import 'package:care_tutor_note_taking_app/providers/notes_provider.dart';
import 'package:care_tutor_note_taking_app/screens/edit_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Note extends StatelessWidget {
  final String index;
  final String title;
  final String content;
  final String createdAt;

  const Note({
    super.key,
    required this.index,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    final NotesProvider notesProvider = Get.find<NotesProvider>();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Created at: $createdAt',
                      style: const TextStyle(
                        fontSize:  10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert,size: 16,),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.edit),
                              title: const Text('Edit'),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EditNote(
                                      id: index,
                                      initialTitle: title,
                                      initialContent: content,
                                    ),
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.delete),
                              title: const Text('Delete'),
                              onTap: () {
                                notesProvider.deleteNote(index);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
