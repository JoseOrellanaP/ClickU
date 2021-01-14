import 'package:clikcus/tools/app_data.dart';
import 'package:clikcus/tools/app_methods.dart';
import 'package:clikcus/tools/app_tools.dart';
import 'package:clikcus/tools/firebase_methods.dart';
import 'package:clikcus/userScreens/signup.dart';
import 'package:flutter/material.dart';

class clickULoginLogOut extends StatefulWidget {
  @override
  _clickULoginLogOutState createState() => _clickULoginLogOutState();
}

class _clickULoginLogOutState extends State<clickULoginLogOut> {



  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethods = new FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
            "Log In Log out"
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 20.0,
            ),
            
            appTextField(
              isPassword: false,
              sidePadding: 18.0,
              textHint: "Email Address",
              textIcon: Icons.email,
              controller: email
            ),
            SizedBox(
              height: 20.0,
            ),
            appTextField(
              isPassword: true,
              sidePadding: 18.0,
              textHint: "Password",
              textIcon: Icons.lock,
              controller: password
            ),
            appButton(
              btnText: "Logging",
              onBtnClicked: verifyLogin,
              btnPadding: 20.0,
              btnColor: Theme.of(context).primaryColor
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignUp())
                );
              },
              child: Text(
                "Not registered? Sign Up here",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  verifyLogin() async{
    if(email.text == ""){
      showSnackBar("Enter an email", scaffoldKey);
      return;
    }

    if(password.text == ""){
      showSnackBar("Password cannot be empty", scaffoldKey);
    }

    displayProgressDialog(context);
    String response = await appMethods.logginUser(email: email.text.toLowerCase(),
        password: password.text.toLowerCase());
    if(response == successful){
      closeProgressDialog(context);
      Navigator.of(context).pop(true);
    }else{
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }


}

