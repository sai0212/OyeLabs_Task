/*import 'package:flutter/material.dart';
import 'package:oyelabs_task/controller/facebook_sign_in_controller.dart';
import 'package:provider/provider.dart';
import 'package:oyelabs_task/screens/login_screen.dart';

class FbSignIn extends StatefulWidget {
  const FbSignIn({Key? key}) : super(key: key);

  @override
  _FbSignInState createState() => _FbSignInState();
}

class _FbSignInState extends State<FbSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Login'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: fbloginUI(),
    );
  }

  fbloginUI() {
    return Consumer<FacebookSignInController>(
      builder: (context, model, child) {
        if (model.userData != null) {
          return Center(
            child: fbloggedInUI(model),
          );
        } else {
          return SignIn.loginControls(context);
        }
      },
    );
  }

  fbloggedInUI(FacebookSignInController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /*CircleAvatar(
          backgroundImage:
              Image.network(model.userData!.photoUrl ?? '').image,
          radius: 50,
        ),*/
        Text(model.userData!["name"] ?? ''),
        Text(model.userData!["email"]),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text("Logout"),
          onPressed: () {
            Provider.of<FacebookSignInController>(context, listen: false)
                .logOut();
          },
        )
      ],
    );
  }
}
*/