import 'package:care_tutor_note_taking_app/providers/user_provider.dart';
import 'package:care_tutor_note_taking_app/widgets/row_gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> _handleRegister() async {
    final username = _username.text.trim();
    final email = _email.text.trim();
    final password = _password.text;
    print(username);
    if (username.length < 3) {
      Get.snackbar("Invalid Username", "Username must be at least 3 characters long",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    if (!isValidEmail(email)) {
      Get.snackbar("Invalid Email", "Please enter a valid email address",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    if (password.length < 6) {
      Get.snackbar("Invalid Password", "Password must be at least 6 characters long",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    final UserProvider userProvider = Get.find<UserProvider>();
    final success = await userProvider.register(username, email, password);

    if (success) {
      Get.snackbar("Registration Successful", "Welcome $username!",
          backgroundColor: Colors.green, colorText: Colors.white);
      Navigator.pop(context);
    } else {
      Get.snackbar("Registration Failed", "Something went wrong. Try again.",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
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
                  Lottie.asset("assets/animation/login_header.json", height: 150, width: 150),
                ],
              ),
            ),
            const RowGap(),
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  _buildInputField(controller: _username, label: "Username"),
                  const SizedBox(height: 16),
                  _buildInputField(controller: _email, label: "Email"),
                  const SizedBox(height: 16),
                  _buildInputField(controller: _password, label: "Password", obscureText: true),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?", style: TextStyle(fontSize: 16)),
                  InkWell(
                    onTap: () {
                       Navigator.pop(context);
                    },
                    child: const Text(
                      " Login",
                      style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: _handleRegister,
              child:  Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 22, 91, 167),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Obx(() {
                  final userProvider = Get.find<UserProvider>();
                  return userProvider.isLoading.value
                      ? const Center(child: CircularProgressIndicator(color: Colors.white))
                      : const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                }),
              ),
            ),

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
