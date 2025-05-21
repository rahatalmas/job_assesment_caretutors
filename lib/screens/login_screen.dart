import 'package:care_tutor_note_taking_app/widgets/row_gap.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _userCtrl, _passCtrl;

  @override
  void initState() {
    _userCtrl = TextEditingController();
    _passCtrl = TextEditingController();

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
                Lottie.asset("assets/animation/login_header.json",width: 120,height: 120),
                Text("My Notes",style: TextStyle(
                  fontSize: 28,fontWeight: FontWeight.bold
                ),)
              ],)
            ),
            RowGap(),
            Expanded(
              flex: 2,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextField(
                    controller: _userCtrl,
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
                              BorderSide(width: 3, color: Colors.yellow)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide:
                              BorderSide(width: 3, color: const Color.fromARGB(255, 32, 91, 167))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide:
                              BorderSide(width: 3, color: const Color.fromARGB(255, 32, 91, 167))),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _passCtrl,
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
                              BorderSide(width: 3, color:const Color.fromARGB(255, 32, 91, 167))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide:
                              BorderSide(width: 3, color:const Color.fromARGB(255, 32, 91, 167))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide:
                              BorderSide(width: 3, color: const Color.fromARGB(255, 32, 91, 167))),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                print("login btn");
              },
              child: Container(
                height: 56,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 32, 91, 167),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 249, 233),
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
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }
}
