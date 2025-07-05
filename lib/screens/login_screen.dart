import 'package:ap2/screens/firebase/auth/firebase_auth_servise.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
final FireBaseAuthService _auth = FireBaseAuthService();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
      children: [
         TextField(
          controller: _emailController,
        decoration: InputDecoration(labelText: 'Email'),
        ),
         TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Password'),
        ),
        ElevatedButton(onPressed: (){
          final String email = _emailController.text;
          final String password = _passwordController.text;
          _auth.singIn(email, password);
        }, child: Text("Logar"))
      ],
      ),
    ),
    );
  }
}
