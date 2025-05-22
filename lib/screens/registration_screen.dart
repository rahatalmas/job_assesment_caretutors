import 'package:care_tutor_note_taking_app/providers/user_provider.dart';
import 'package:care_tutor_note_taking_app/screens/login_screen.dart';
import 'package:care_tutor_note_taking_app/widgets/row_gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _username, _email, _password;

  @override
  void initState() {
    _username = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
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
                  const Text(
                    "Start Taking Notes",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Lottie.asset("assets/animation/login_header.json",height: 150,width: 150)
                ],
              ),
            ),
            RowGap(),
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  _buildInputField(
                    controller: _username,
                    label: "Username",
                  ),
                  const SizedBox(height: 16),
                  _buildInputField(
                    controller: _email,
                    label: "Email",
                  ),
                  const SizedBox(height: 16),
                  _buildInputField(
                    controller: _password,
                    label: "Password",
                    obscureText: true,
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
                Text("Already Have Account?",style: TextStyle(fontSize: 16),),
                InkWell(
                  child:Text("Login",style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return LoginScreen();
                    }));
                  },
                  )
              ],
            ),
            ),
            

            InkWell(
              onTap: () async {
                final UserProvider userProvider = Get.find<UserProvider>();
                userProvider.register(_username.text, _email.text, _password.text);
              },
              child: Container(
                height: 56,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 22, 91, 167),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Register",
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

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        label: Text(label, style: const TextStyle(fontSize: 18)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 22, 91, 167)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 22, 91, 167)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 22, 91, 167)),
        ),
      ),
    );
  }
}
