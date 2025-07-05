
import 'package:ap2/models/user_model.dart';
import 'package:ap2/screens/firebase/auth/firebase_auth_servise.dart';
import 'package:ap2/screens/home.dart';
import 'package:ap2/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:ap2/firebase_options.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Home(),
      home: InitalizeApp(),
    );
  }
}
class InitalizeApp extends StatelessWidget {
  final FireBaseAuthService _auth = FireBaseAuthService();

  InitalizeApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(stream: _auth.user,
        builder: (context,snapshot) {
       if(snapshot.connectionState == ConnectionState.waiting) {
         return const Center(
           child: CircularProgressIndicator(),
         );
       } else if(snapshot.hasData && snapshot.data!.email.isNotEmpty){
         return const Home();
       }
       return LoginPage();
    });
  }
}
 