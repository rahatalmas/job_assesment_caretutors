import 'package:care_tutor_note_taking_app/providers/notes_provider.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../models/user_model.dart';

class UserProvider extends GetxController {
  final UserController _userController = UserController();

  var currentUser = Rxn<UserModel>();
  var isLoading = false.obs;

  Future<bool> register(String username, String email, String password) async {
    isLoading.value = true;
    try {
      final user = await _userController.registerUser(username, email, password);
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> login(String email, String password) async {
    isLoading.value = true;
    try {
      final user = await _userController.loginUser(email, password);
      if (user != null) {
        currentUser.value = user;
        final NotesProvider notesProvider = Get.find<NotesProvider>();
        print("USER ID ${user.id}");
        notesProvider.fetchNotes(user.id);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    NotesProvider noteProvider = Get.find<NotesProvider>();
    noteProvider.notes.clear();
    currentUser.value = null;
  }
}
