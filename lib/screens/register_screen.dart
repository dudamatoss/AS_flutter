import 'package:ap2/screens/firebase/auth/firebase_auth_servise.dart';
import 'package:ap2/service/firebase_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:ap2/styles/screens_style.dart';
import 'package:ap2/styles/login_style.dart';

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
      backgroundColor: HomeStyles.secondaryColor,
      body: Padding(
        padding: LoginStyles.pagePadding,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/rosa_dos_ventos.png',
                  height: LoginStyles.logoHeight,
                  fit: BoxFit.contain,
                ),
                LoginStyles.topSpacing,
                TextField(
                  controller: _nomeController,
                  style: LoginStyles.inputText,
                  decoration: LoginStyles.nameDecoration(
                    Colors.white.withOpacity(0.3),
                  ),
                ),
                LoginStyles.fieldSpacing,
                TextField(
                  controller: _emailController,
                  style: LoginStyles.inputText,
                  decoration: LoginStyles.emailDecoration(
                    Colors.white.withOpacity(0.3),
                  ),
                ),
                LoginStyles.fieldSpacing,
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: LoginStyles.inputText,
                  decoration: LoginStyles.passwordDecoration(
                    Colors.white.withOpacity(0.3),
                  ),
                ),
                LoginStyles.buttonSpacing,
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      debugPrint(_emailController.text);
                      debugPrint(_passwordController.text);
                      fireBaseUtil.register(_nomeController.text, _emailController.text, _passwordController.text);
                      Navigator.pop(context);
                    },
                    style: LoginStyles.loginButton,
                    child: const Text(
                      "Cadastre-se",
                      style: LoginStyles.buttonText,
                    ),
                  ),
                ),
                LoginStyles.fieldSpacing,
                RichText(
                  text: TextSpan(
                    style: LoginStyles.bottomText,
                    children: [
                      const TextSpan(text: 'Já possui conta? '),
                      TextSpan(
                        text: 'Logar',
                        style: LoginStyles.registerLink(HomeStyles.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}