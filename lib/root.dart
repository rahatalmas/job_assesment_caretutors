import 'package:care_tutor_note_taking_app/constant.dart';
import 'package:care_tutor_note_taking_app/screens/home.dart';
import 'package:care_tutor_note_taking_app/widgets/screen_container.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class Root extends StatefulWidget {
  const Root({super.key, required this.title});

  final String title;

  @override
  State<Root> createState() => _Root();
}

class _Root extends State<Root> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _children = [
     MyHomePage(title: "My Note"),
     Text("hello")
  ];

  // Global key to access the scaffold state
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Ensure the TabController length matches the number of tabs and views
    _tabController = TabController(length: _children.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Assign the scaffold key
      backgroundColor: neutralWhite,
      appBar: AppBar(
        centerTitle: true,
        elevation: 3,
        shadowColor: Colors.black,
        backgroundColor: neutralWhite,
        leading: IconButton(
          icon: Icon(Icons.menu, color: appTextPrimary, size: 28),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          "Home",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: appTextPrimary),
        ),
      ),
      body: ScreenContainer(
        child: TabBarView(
          controller: _tabController,
          children: _children,
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
            color: neutralBG, borderRadius: BorderRadius.circular(12)),
        child: TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            color: brandMinus1, // Green color for the selected tab
            borderRadius: BorderRadius.circular(12), // Optional rounded corners
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          // Ensures the indicator spans the full tab width
          labelPadding: EdgeInsets.zero,
          // Removes padding around the label
          labelColor: brandPlus2,
          // Text and icon color for the selected tab
          unselectedLabelColor: Colors.grey,
          // Text and icon color for unselected tabs
          tabs: const [
            Tab(icon: Icon(Icons.home), text: "Home"),
            Tab(icon: Icon(Icons.sailing), text: "Result"),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: neutralWhite,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: colorPrimary,
              ),
              accountName: Text('Almas'),
              accountEmail: Text('Total Notes: 10'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: kColorPrimary,
                child: ClipOval(
                  child: Image.asset(
                    'assets/animation/login_header.json',
                    //width: 50,
                    //height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text("All Exams"),
              
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("All Results"),
              onTap: () {
                
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              onTap: () async {
                
                  }
                
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("TestPage"),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context)=>PaperProcessingResult(success: [], errors: []))
                // );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorPrimary,
              onPressed: () {
                print("New note creation");
              },
              tooltip: 'New Note',
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
        ),
      );
  }
}