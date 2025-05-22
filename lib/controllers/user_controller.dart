import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class UserController {
  Future<UserModel?> registerUser(String username, String email, String password) async {
    try {
      final docRef = await firestore.collection('users').add({
        'username': username,
        'email': email,
        'password': password,
      });

      final docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        print('User registered successfully.');
        return UserModel.fromMap(docSnapshot.data()!, docRef.id);
      }
      return null;
    } catch (e) {
      print('Registration error: $e');
      return null;
    }
  }

  Future<UserModel?> loginUser(String email, String password) async {
    try {
      final snapshot = await firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        print("success");
        return UserModel.fromMap(doc.data(), doc.id);
      } else {
        print('Invalid credentials');
        return null;
      }
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }
}
