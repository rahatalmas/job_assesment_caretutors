import 'package:care_tutor_note_taking_app/widgets/note.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool login = true;

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
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Note(
                        index: 0,
                        content: 'This is a sample note. You can update it with real content.',
                        createdAt: DateTime.now(),
                      );},
                  )
                ],
              );
  }
}
