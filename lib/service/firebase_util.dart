import 'package:firebase_auth/firebase_auth.dart';

class FireBaseUtil {
  final FirebaseAuth auth = FirebaseAuth.instance;

  register(String nome, String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}