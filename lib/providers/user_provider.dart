import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../models/user_model.dart';

class UserProvider extends GetxController {
  final UserController _userController = UserController();

  var currentUser = Rxn<UserModel>();
  var isLoading = false.obs;

  Future<void> register(String username, String email, String password) async {
    isLoading.value = true;
    await _userController.registerUser(username, email, password);
    isLoading.value = false;
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final user = await _userController.loginUser(email, password);
    if (user != null) {
      currentUser.value = user;
    }
    isLoading.value = false;
  }

  void logout() {
    currentUser.value = null;
  }
}
