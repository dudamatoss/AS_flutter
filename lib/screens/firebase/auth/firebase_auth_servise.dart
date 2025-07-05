import 'package:ap2/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseAuthService {
  //para ter a instancia da classe FireBase Auth, p login e logout
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //mapeando esse stream para transformar ele em um usuario model
  Stream<UserModel> get user {
    //"ouvindo" qualquer alteraação que aconteça em quesito de autenticação
    return _auth.authStateChanges().map((user) {
       return UserModel(email: user?.email ??"");
    });
  }
  singIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e)
    {
      debugPrint(e.toString());
    }
  }
}