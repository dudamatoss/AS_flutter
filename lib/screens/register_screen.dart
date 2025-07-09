import 'package:ap2/screens/firebase/auth/firebase_auth_servise.dart';
import 'package:ap2/service/firebase_util.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final fireBaseUtil = FireBaseUtil();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nomeController, decoration: InputDecoration(labelText: "Nome")),
            TextField(controller:_emailController,decoration: InputDecoration(labelText: "Email")),
            TextField(controller: _passwordController,decoration: InputDecoration(labelText: "Password")),
            ElevatedButton(onPressed: (){
              debugPrint(_emailController.text);
              debugPrint(_passwordController.text);
              fireBaseUtil.register(_nomeController.text, _emailController.text, _passwordController.text);
              Navigator.pop(context);
              },
                child: Text("Cadastre-se"))
          ],
        ),
      ),
    );
  }
}
