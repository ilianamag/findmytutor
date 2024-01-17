import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/models/student_model/student.dart';
import 'package:login/models/student_model/studentPreferences.dart';
import 'package:login/models/tutor_model/tutor.dart';
import 'package:login/widgets/text_field_stateful.dart';
import 'package:http/http.dart' as http;
import 'package:login/api_connection/api_connection.dart';

//Global keys
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//Text Editing Controllers
TextEditingController emailAddress = TextEditingController();
TextEditingController password = TextEditingController();

class LoginPageRemastered extends StatefulWidget {
  const LoginPageRemastered({Key? key}) : super(key: key);

  @override
  State<LoginPageRemastered> createState() => _LoginPageRemasteredState();
}

class _LoginPageRemasteredState extends State<LoginPageRemastered> {
  bool pInvisibility = true;
  bool enableLogin = false;

  @override
  void initState() {
    super.initState();

    // Add listeners to the text controllers
    emailAddress.addListener(updateButtonStatus);
    password.addListener(updateButtonStatus);
  }

  @override
  void dispose() {
    // Remove listeners when the widget is disposed
    emailAddress.removeListener(updateButtonStatus);
    password.removeListener(updateButtonStatus);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector (
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold (
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column (children: [

                    //logo
                    CustomImageView(
                      imagePath: ImageConstant.imgLogo1,
                        height: 124.v,
                        width: 137.h,
                        radius: BorderRadius.circular(
                          32.h,
                        ),
                    ),
                    SizedBox(height: 70.v),

                    //Email Text Field           
                    TextFieldStateful (
                      width: 210.h,
                      controller: emailAddress,
                      prefix: Icon(Icons.email, size: 25),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: appTheme.gray800,
                        fontSize: 16.fSize,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                      suffix:
                        IconButton (
                          icon: Icon(Icons.clear, size:25),
                          onPressed:() {
                            emailAddress.clear();
                          }
                        ), 
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 35.v),

                    //Password Text Field
                    TextFieldStateful (
                      width: 210.h,
                      controller: password,
                      prefix: Icon(Icons.lock, size: 25),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: appTheme.gray800,
                        fontSize: 16.fSize,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                      suffix: IconButton (
                        onPressed: () {
                          setState(() => pInvisibility = !pInvisibility);
                        },
                        icon: Icon(
                          pInvisibility
                          ? Icons.visibility_off
                          : Icons.visibility,
                          size: 25
                        )
                      ),
                      obscureText: pInvisibility,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 35.v),

                    //Login Button
                    ElevatedButton.icon(
                      onPressed: enableLogin
                      ? () {
                        if(_formKey.currentState!.validate()) _checkCredentials();
                      } :null,
                      icon: Icon(
                        Icons.arrow_forward
                      ),
                      label: Text(
                          "Login",
                          style: TextStyle(
                            //color: appTheme.gray90001,
                            fontSize: 16.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFDC2E2E),
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: Colors.grey[400],
                        disabledForegroundColor: Colors.grey[850],
                        elevation: 0,
                        fixedSize: Size(101, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.circleBorder20,
                        ),
                      ),
                    ),
                    SizedBox(height: 50.v),

                  ],),
                ),
              ),
            ),
          ),
          //SignUp;
          bottomNavigationBar: Container(
            height: 56,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?",
                    style: TextStyle(
                      color:
                        appTheme.black900,
                        fontSize: 16.fSize,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      )
                    ),
                    TextButton (
                      onPressed: () {
                        onTapTxtSignUp(context);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: Colors.transparent,)
                      ),
                      child: Text (
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16.fSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        )
                      ),
                    )
                  ],),
                  SizedBox(height: 5.v),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapTxtSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.enaAlloSignUp);
  }
  onTapTxtLogIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.enaAlloSignUp);
  }

  void updateButtonStatus() {
    setState(() {
      enableLogin = emailAddress.text.isNotEmpty && password.text.isNotEmpty;
    });
  }

  _checkStud() async {
    var res = await http.post(
      Uri.parse(API.loginStud),
      body: {
        "email": emailAddress.text.trim(),
      }
    );

    if (res.statusCode == 200) {
      var resBodyOfLogin;
      print(res.body);
      try{
        resBodyOfLogin = jsonDecode(res.body);
      }
      catch(e) {
        print(e);
      }
      if (resBodyOfLogin['success'] == true) {
        Student studentInfo = Student.fromJson(resBodyOfLogin["userData"]);
        await RememberStudentPreferences.storeStudentInfo(studentInfo);
        Navigator.pushNamed(context, AppRoutes.studentProfileScreen);
        emailAddress.clear();
        password.clear();
      }
      else {
        _checkTut();
      }
    }
  }

  _checkTut() async {
    var rest = await http.post(
    Uri.parse(API.loginTut),
      body: {
        "email": emailAddress.text.trim(),
      }
    );
    if (rest.statusCode == 200) {
      var resBodyOfLoginT;
      print(rest.body);
      try{
        resBodyOfLoginT = jsonDecode(rest.body);
      }
      catch(e) {
        print(e);
      }
      if (resBodyOfLoginT['success'] == true) {
        Tutor TutorInfo = Tutor.fromJson(resBodyOfLoginT["userData"]);
        Navigator.pushNamed(context, AppRoutes.tutorProfilePage);
        emailAddress.clear();
        password.clear();
      }
      else {
        password.clear();
        _buildErrorSnackBar(context);        
      }
    }
  }

  _checkCredentials() async {
    var res = await http.post(
      Uri.parse(API.login),
      body: {
        "email": emailAddress.text.trim(),
        "password": password.text.trim(),
      }
    );

    if (res.statusCode == 200) {
      var resBodyOfLogin;
      print(res.body);
      try{
        resBodyOfLogin = jsonDecode(res.body);
      }
      catch(e) {
        print(e);
      }
      if (resBodyOfLogin['success'] == true) {
        _checkStud();
      }
      else {
        password.clear();
        _buildErrorSnackBar(context);
      } 
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _buildErrorSnackBar(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 6,
        backgroundColor: Colors.transparent,
        content: Container (
          width: 252,
          height:63,
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center (
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Εσφαλμένοι κωδικοί πρόσβασης.\n Παρακαλώ, προσπαθείστε ξανά!',
                  style: TextStyle(
                    fontSize: 16.fSize,
                    fontFamily: 'Roboto'
                  )
                )
              ]
            )
          )
        ),
        duration: Duration(seconds: 3)
      )
    );
  }
}