import 'package:care_tutor_note_taking_app/constant.dart';
import 'package:care_tutor_note_taking_app/providers/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class EditNote extends StatefulWidget {
  final String id;
  final String initialTitle;
  final String initialContent;

  const EditNote({
    super.key,
    required this.id,
    required this.initialTitle,
    required this.initialContent,
  });

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late TextEditingController _titleController;
  late TextEditingController _noteController;

  final InputDecoration _textFieldDecoration = InputDecoration(
    labelText: "Title",
    hintText: "Enter title",
    hintStyle: const TextStyle(color: Colors.black),
    labelStyle: const TextStyle(color: Colors.black),
    prefixIcon: const Icon(Icons.title, color: kColorPrimary),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: kColorSecondary, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: kColorSecondary, width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: kColorPrimary, width: 2.0),
    ),
    fillColor: Colors.white,
    filled: true,
  );

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle);
    _noteController = TextEditingController(text: widget.initialContent);
  }

  void _saveNote() async {
    final NotesProvider notesProvider = Get.find<NotesProvider>();
    final title = _titleController.text.trim();
    final content = _noteController.text.trim();

    if (title.isEmpty || content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Title or note cannot be empty"),
          duration: Duration(seconds: 1),
        ),
      );
      return;
    }

    await notesProvider.updateNote(widget.id, title, content);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Note updated"),
        duration: Duration(milliseconds: 800),
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutralWhite,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          InkWell(
            onTap: _saveNote,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                    color: kColorPrimary, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
        title: const Text(
          "Edit Note",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: neutralWhite,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _titleController,
              decoration: _textFieldDecoration,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: _noteController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                expands: true,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  hintText: "Write your notes here...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          if (!isKeyboardVisible) const SizedBox(height: 10),
        ],
      ),
    );
  }
}
