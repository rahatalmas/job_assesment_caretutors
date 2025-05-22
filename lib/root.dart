import 'package:care_tutor_note_taking_app/constant.dart';
import 'package:care_tutor_note_taking_app/providers/user_provider.dart';
import 'package:care_tutor_note_taking_app/screens/add_note.dart';
import 'package:care_tutor_note_taking_app/screens/notes_screen.dart';
import 'package:care_tutor_note_taking_app/screens/profile_screen.dart';
import 'package:care_tutor_note_taking_app/widgets/screen_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatefulWidget {
  const Root({super.key, required this.title});
  final String title;
  @override
  State<Root> createState() => _Root();
}

class _Root extends State<Root> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Widget> _children = [
     NotesPage(title: "My Note"),
     ProfilePage()
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _children.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Get.find<UserProvider>();
    return Scaffold(
      key: _scaffoldKey,
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
          "My Notes",
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
            color: brandMinus1,
            borderRadius: BorderRadius.circular(12),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: EdgeInsets.zero,
          labelColor: brandPlus2,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: "Home"),
            Tab(icon: Icon(Icons.person), text: "Profile"),
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
              accountName: Text(userProvider.currentUser.value!.username),
              accountEmail: Text(userProvider.currentUser.value!.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: kColorPrimary,
                child: ClipOval(
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset("assets/image/dp.jpg",fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              onTap: () async {
                userProvider.logout();
              }   
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorPrimary,
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=> const AddNote()));
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



