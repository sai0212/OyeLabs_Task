
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:oyelabs_task/screens/home.dart';
import 'package:oyelabs_task/screens/login.dart';
import 'package:oyelabs_task/screens/sign_up.dart';
import 'package:provider/provider.dart';

import 'controller/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
          child: LoginPage(),
        ),
        /*ChangeNotifierProvider(
          create: (context) => FacebookSignInController(),
          child: FbSignIn(),
        )*/
      ],
    

    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OyeLabs Task',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: //Splash()
          AnimatedSplashScreen(
        nextScreen: LoginScreen(),
        splash: 'assets/elssa_logo.png',
        splashIconSize: 600,
        splashTransition: SplashTransition.fadeTransition,
        /*Center(
        child: Container(
          child: Image.asset('assets/elssa_1.png', scale: 2.0)
        ),
      ),*/
      ),
    ),
    );
  }
}
