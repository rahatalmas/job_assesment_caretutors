import 'package:care_tutor_note_taking_app/screens/login_screen.dart';
import 'package:care_tutor_note_taking_app/widgets/row_gap.dart';
import 'package:care_tutor_note_taking_app/widgets/screen_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Note',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'My Note'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool login = false;
  @override
  Widget build(BuildContext context) {
    return login ? Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ScreenContainer(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amberAccent
              ),
              child: Row(
                children: [
                  Text("Col-1"),
                  Text("Col-2")
                ],
              ),
            ),
            RowGap(),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            )
          ],
        ) 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){print("hello");},
        tooltip: 'new note',
        child: const Icon(Icons.add),
      ),
    )
    :
    LoginScreen();
  }
}
