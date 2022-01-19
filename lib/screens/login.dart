import 'package:flutter/material.dart';
//import 'package:login_tutorial/controllers/login_controller.dart';
import 'package:oyelabs_task/controller/controller.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginUI(),
    );
  }

  // creating a function loginUI

  loginUI() {
    // loggedINUI
    // loginControllers

    return Consumer<LoginController>(builder: (context, model, child) {
      // if we are already logged in
      if (model.userDetails != null) {
        return Center(
          child: loggedInUI(model),
        );
      } else {
        return loginControllers(context);
      }
    });
  }

  loggedInUI(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      // our ui will have 3 children, name, email, photo , logout button

      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.userDetails!.photoURL ?? "").image,
          radius: 50,
        ),

        Text(model.userDetails!.displayName ?? ""),
        Text(model.userDetails!.email ?? ""),

        // logout
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("Logout"),
            onPressed: () {
              Provider.of<LoginController>(context, listen: false).logout();
            })
      ],
    );
  }
}


loginControllers(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(6, 20, 15, 60)),
          Container(
            child: Text('Welcome Back',
            style: TextStyle(
              fontSize: 50,
            ))
          ),
           Padding(padding: EdgeInsets.fromLTRB(14, 100, 14, 100)),
          Material(
            
            color: Color(0xff7583ca),
            elevation: 8,
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAliasWithSaveLayer,
           child: InkWell(
             splashColor: Colors.grey,
             onTap: () {
                Provider.of<LoginController>(context, listen: false)
                    .facebooklogin();
              },
             child: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Ink.image(
                   image: AssetImage('assets/fb.png'),
                   height: 30,
                   width: 40,
                   fit: BoxFit.fitHeight,
                 ),
                 SizedBox(width: 6),
                 Text(
                   'Sign In With Facebook',
                   style: TextStyle(fontSize: 30, color: Colors.black),
                 ),
                 SizedBox(width: 6),

                 
               ],
             ),
           ),
          ),

            Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                    ),
          Material(
            
            color: Colors.white70,
            elevation: 8,
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAliasWithSaveLayer,
           child: InkWell(
             splashColor: Colors.grey,
            onTap: () {
                Provider.of<LoginController>(context, listen: false)
                    .googleLogin();
             },
             child: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Ink.image(
                   image: AssetImage('assets/google_logo.png'),
                   height: 30,
                   width: 40,
                   fit: BoxFit.fitHeight,
                 ),
                 SizedBox(width: 6),
                 Text(
                   'Sign In With Google',
                   style: TextStyle(fontSize: 30, color: Colors.black),
                 ),
                 SizedBox(width: 6),
               ],
             ),
           ),
          ),
        ],
      ),
    );
  }
