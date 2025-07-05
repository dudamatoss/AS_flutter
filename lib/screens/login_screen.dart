import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
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
          debugPrint("Olaaaa " + _emailController.text);
        }, child: Text("Logar"))
      ],
      ),
    ),
    );
  }
}
