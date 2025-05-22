import 'package:care_tutor_note_taking_app/providers/user_provider.dart';
import 'package:care_tutor_note_taking_app/root.dart';
import 'package:care_tutor_note_taking_app/screens/add_note.dart';
import 'package:care_tutor_note_taking_app/screens/edit_note_screen.dart';
import 'package:care_tutor_note_taking_app/screens/login_screen.dart';
import 'package:care_tutor_note_taking_app/screens/registration_screen.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  redirect: (context, state) {
    final userProvider = Get.find<UserProvider>();
    final isLoggedIn = userProvider.currentUser.value != null;

    final loggingIn = state.uri.toString() == '/login' || state.uri.toString() == '/register';

    if (!isLoggedIn && !loggingIn) return '/login';
    if (isLoggedIn && loggingIn) return '/';

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Root(title: "My Notes"),
    ),
    GoRoute(
      path: '/addnote',
      builder: (context, state) => const AddNote(),
    ),
    GoRoute(
      path: '/editnote',
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;

        return EditNote(
          id: args['id'],
          initialTitle: args['initialTitle'],
          initialContent: args['initialContent'],
        );
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);