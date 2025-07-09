import 'package:ap2/screens/firebase/auth/firebase_auth_servise.dart';
import 'package:ap2/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:ap2/styles/screens_style.dart';
import 'package:ap2/styles/login_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FireBaseAuthService _auth = FireBaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    await _auth.singIn(email, password);
  }

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
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
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
                    onPressed: _login,
                    style: LoginStyles.loginButton,
                    child: const Text(
                      'Entrar',
                      style: LoginStyles.buttonText,
                    ),
                  ),
                ),
                LoginStyles.fieldSpacing,

                RichText(
                  text: TextSpan(
                    style: LoginStyles.bottomText,
                    children: [
                      const TextSpan(text: 'Não tem uma conta? '),
                      TextSpan(
                        text: 'Cadastre-se',
                        style: LoginStyles.registerLink(HomeStyles.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return RegisterPage();
                            }));
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}