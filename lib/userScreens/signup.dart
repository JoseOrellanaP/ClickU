import 'package:clikcus/tools/app_data.dart';
import 'package:clikcus/tools/app_methods.dart';
import 'package:clikcus/tools/app_tools.dart';
import 'package:clikcus/tools/firebase_methods.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  TextEditingController fullName = new TextEditingController();
  TextEditingController fullNumber = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController re_password = new TextEditingController();
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
              "Sign Up"
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
                  textHint: "Full Name",
                  textIcon: Icons.person,
                  controller: fullName
              ),

              SizedBox(
                height: 20.0,
              ),
              appTextField(
                  isPassword: false,
                  sidePadding: 18.0,
                  textHint: "Phone Number",
                  textIcon: Icons.phone,
                  textType: TextInputType.number,
                  controller: fullNumber
              ),

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
              SizedBox(
                height: 20.0,
              ),
              appTextField(
                  isPassword: true,
                  sidePadding: 18.0,
                  textHint: "Re-Password",
                  textIcon: Icons.lock,
                  controller: re_password
              ),
              appButton(
                  btnText: "Create Account",
                  onBtnClicked: verifyDetails,
                  btnPadding: 20.0,
                  btnColor: Theme.of(context).primaryColor
              ),
            ],
          ),
        )
    );
  }

  verifyDetails() async{

    if(fullName.text == ""){
      showSnackBar("Name cannot be empty", scaffoldKey);
      return;
    }

    if(fullNumber.text == ""){
      showSnackBar("Phone Number cannot be empty", scaffoldKey);
      return;
    }


    if(email.text == ""){
      showSnackBar("Enter an email", scaffoldKey);
      return;
    }

    if(password.text == ""){
      showSnackBar("Password cannot be empty", scaffoldKey);
      return;
    }

    if(re_password.text == ""){
      showSnackBar("Re_password cannot be empty", scaffoldKey);
      return;
    }

    if(password.text != re_password.text){
      showSnackBar("Passwords don't match", scaffoldKey);
      return;
    }

    displayProgressDialog(context);

    String response = await appMethods.createUserAccount(
      fullName: fullName.text,
      phone: fullNumber.text,
      email: email.text.toLowerCase(),
      password: password.text.toLowerCase(),
    );

    if(response == successful){
      closeProgressDialog(context);
      Navigator.of(context).pop();
      Navigator.of(context).pop(true);
    }else{
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }

  }

}
