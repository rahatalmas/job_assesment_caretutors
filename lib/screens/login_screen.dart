import 'package:care_tutor_note_taking_app/providers/user_provider.dart';
import 'package:care_tutor_note_taking_app/screens/registration_screen.dart';
import 'package:care_tutor_note_taking_app/widgets/row_gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _user, _pass;

  @override
  void initState() {
    _user = TextEditingController();
    _pass = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome Back",style: TextStyle(
                  fontSize: 28,fontWeight: FontWeight.bold
                ),),
                Lottie.asset("assets/animation/login_header.json",width: 150,height: 150),
              
              ],)
            ),
            RowGap(),
            Expanded(
              flex: 1,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextField(
                    controller: _user,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      fillColor: Colors.black,
                      label: Text(
                        "Username",
                        style: TextStyle(fontSize: 18),
                      ),
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide:
                              BorderSide(width: 2, color: Colors.yellow)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide:
                              BorderSide(width: 2, color: const Color.fromARGB(255, 22, 91, 167))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide:
                              BorderSide(width: 2, color: const Color.fromARGB(255, 22, 91, 167))),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _pass,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      label: Text(
                        "Password",
                        style: TextStyle(fontSize: 18),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide:
                              BorderSide(width: 2, color:const Color.fromARGB(255, 22, 91, 167))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide:
                              BorderSide(width: 2, color:const Color.fromARGB(255, 22, 91, 167))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide:
                              BorderSide(width: 2, color: const Color.fromARGB(255, 22, 91, 167))),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have accout?",style: TextStyle(fontSize: 16),),
                InkWell(
                  child:Text("Register",style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return RegisterScreen();
                    }));
                  },
                  )
              ],
            ),
            ),
            InkWell(
              onTap: () async {
                final UserProvider userProvider = Get.find<UserProvider>();
                userProvider.login(_user.text,_pass.text);
              },
              child: Container(
                height: 56,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 22, 91, 167),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _user.dispose();
    _pass.dispose();
    super.dispose();
  }
}
