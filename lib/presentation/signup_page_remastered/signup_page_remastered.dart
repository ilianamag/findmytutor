import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_drop_down_menu.dart';
import 'package:login/widgets/custom_icon_button.dart';
import 'package:login/widgets/text_field_stateful.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/api_connection/api_connection.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Global key
  GlobalKey<FormState> _formKeySignUp = GlobalKey<FormState>();

  //Controllers
  TextEditingController nameEditTextController = TextEditingController();
  TextEditingController lastNameEditTextController = TextEditingController();
  TextEditingController emailEditTextController = TextEditingController();
  TextEditingController passwordEditTextController = TextEditingController();
  TextEditingController priceController= TextEditingController();
  TextEditingController radiusController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController infoController = TextEditingController();

  //Lists
  List<String> dropdownItemList = [
      "Student",
      "Teacher",
  ];
  List<String> categoriesDropDownList = [];
  List<String> professionDropDownList = [];

  //Booleans
  bool isTeacherSelected = false;
  bool isCategorySelected = false;
  bool pInvisibility = true;
  bool enableSignUp = false;

  //Listeners
  @override
  void initState() {
    super.initState();

    // Add listeners to the text controllers
    roleController.addListener(addTextFields);
    categoryController.addListener(addProfessionList);
    nameEditTextController.addListener(updateButtonStatus);
    lastNameEditTextController.addListener(updateButtonStatus);
    emailEditTextController.addListener(updateButtonStatus);
    passwordEditTextController.addListener(updateButtonStatus);
    roleController.addListener(updateButtonStatus);
    priceController.addListener(updateButtonStatus);
    radiusController.addListener(updateButtonStatus);
    categoryController.addListener(updateButtonStatus);
    professionController.addListener(updateButtonStatus);
  }

  @override
  void dispose() {
    // Remove listeners when the widget is disposed
    roleController.removeListener(addTextFields);
    categoryController.addListener(addProfessionList);
    nameEditTextController.removeListener(updateButtonStatus);
    lastNameEditTextController.removeListener(updateButtonStatus);
    emailEditTextController.removeListener(updateButtonStatus);
    passwordEditTextController.removeListener(updateButtonStatus);
    roleController.removeListener(updateButtonStatus);
    priceController.removeListener(updateButtonStatus);
    radiusController.removeListener(updateButtonStatus);
    categoryController.removeListener(updateButtonStatus);
    professionController.removeListener(updateButtonStatus);
    super.dispose();
  }
  
  ///Void Functions
  //AddTeachers' extra fields
  void addTextFields() {
    setState(() {
      if (roleController.text == 'Teacher') {
        isTeacherSelected = true;
        fetchCategories();
      }
      else isTeacherSelected = false;
    });
  }

  //Add Profession Field
  void addProfessionList() {
    setState(() {
      if (categoryController.text.isNotEmpty) {
        isCategorySelected = true;
        fetchProfessions();
      }
    });
  }

  //Create account
  void _createAccount() {
    if (isTeacherSelected) _createAccountTutor();
     else _createAccountStudent();
  }

  //Enable/Disable SignUp button
  void updateButtonStatus() {
    bool temp1 = false;
    bool temp2 = false;
    temp1 = nameEditTextController.text.isNotEmpty && lastNameEditTextController.text.isNotEmpty
            && passwordEditTextController.text.isNotEmpty && emailEditTextController.text.isNotEmpty
            && roleController.text.isNotEmpty;
    if (isTeacherSelected) {
      temp2 = temp1 && priceController.text.isNotEmpty && radiusController.text.isNotEmpty 
              && categoryController.text.isNotEmpty && professionController.text.isNotEmpty;
    }
    setState(() {
      if (isTeacherSelected) enableSignUp = temp2;
      else enableSignUp = temp1;
    });
  }

  ///Communication with database
  fetchCategories() async {
    var response = await http.get(
      Uri.parse(API.fCats),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        categoriesDropDownList = List<String>.from(data);
      });
    }
  }
  

  fetchProfessions() async {
    var response = await http.post(
      Uri.parse(API.fProfs),
      body: {
        "category": categoryController.text
      }
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        professionDropDownList = List<String>.from(data);
      });
    }
  }

  _createAccountStudent() async {
    var response = await http.post(
      Uri.parse(API.signUp),
      body: {
        "firstname": nameEditTextController.text.trim(),
        "lastname": lastNameEditTextController.text.trim(),
        "email": emailEditTextController.text.trim(),
        "password": passwordEditTextController.text.trim(),
        "profilepic": "",
      }
    );

    if (response.statusCode == 200) {
      var resBodyOfSignUp;
      print(response.body);
      try{
        resBodyOfSignUp = jsonDecode(response.body);
      }
      catch(e) {
        print(e);
      }
      if (resBodyOfSignUp['success'] == true) {
        response = await http.post(
          Uri.parse(API.signUpStud),
          body: {
            "email": emailEditTextController.text.trim(),
          }
        );

        if (response.statusCode == 200) {
          var resBodyOfSignUp;
          print(response.body);
          try{
            resBodyOfSignUp = jsonDecode(response.body);
          }
          catch(e) {
            print(e);
          }
          if (resBodyOfSignUp['success'] == true) {
            Navigator.pushNamed(context, AppRoutes.studentProfileScreen);
            nameEditTextController.clear();
            lastNameEditTextController.clear();
            emailEditTextController.clear();
            passwordEditTextController.clear();
            roleController.clear();
          }
          else _buildErrorSnackBar(context);
        }
      }
      else _buildErrorSnackBar(context);
    }
  }

  _createAccountTutor() async {
    String moreInfo;
    if (infoController.text.isEmpty) moreInfo = 'None Available';
    else moreInfo = infoController.text.trim();
    var response = await http.post(
      Uri.parse(API.signUp),
      body: {
        "firstname": nameEditTextController.text.trim(),
        "lastname": lastNameEditTextController.text.trim(),
        "email": emailEditTextController.text.trim(),
        "password": passwordEditTextController.text.trim(),
        "profilepic": "",
      }
    );

    if (response.statusCode == 200) {
      var resBodyOfSignUp;
      print(response.body);
      try{
        resBodyOfSignUp = jsonDecode(response.body);
      }
      catch(e) {
        print(e);
      }
      if (resBodyOfSignUp['success'] == true) {
        response = await http.post(
          Uri.parse(API.signUpTut),
          body: {
            "email": emailEditTextController.text.trim(),
            "pph": priceController.text.trim(),
            "radius": radiusController.text.trim(),
            "category": categoryController.text.trim(),
            "profession": professionController.text.trim(),
            "information": moreInfo,
          }
        );

        if (response.statusCode == 200) {
          var resBodyOfSignUp;
          print(response.body);
          try{
            resBodyOfSignUp = jsonDecode(response.body);
          }
          catch(e) {
            print(e);
          }
          if (resBodyOfSignUp['success'] == true) {
            Navigator.pushNamed(context, AppRoutes.tutorProfilePage);
            nameEditTextController.clear();
            lastNameEditTextController.clear();
            emailEditTextController.clear();
            passwordEditTextController.clear();
            roleController.clear();
          }
          else _buildErrorSnackBar(context);
        }
      }
      else _buildErrorSnackBar(context);
    }
  }

  //Build
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKeySignUp,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 102.v,
                      width: 108.h,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: 90.v,
                              width: 92.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 13.h,
                                vertical: 9.v,
                              ),
                              decoration: AppDecoration.fillRed.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder45,
                              ),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgSettings,
                                  height: 57.v,
                                  width: 64.h,
                                  alignment: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          CustomIconButton(
                              height: 43.v,
                              width: 46.h,
                              padding: EdgeInsets.all(9.h),
                              alignment: Alignment.bottomRight,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgEdit,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.v),
                    _buildNameEditText(context),
                    SizedBox(height: 27.v),
                    _buildLastNameEditText(context),
                    SizedBox(height: 27.v),
                    _buildEmailEditText(context),
                    SizedBox(height: 27.v),
                    _buildPasswordEditText(context),
                    SizedBox(height: 27.v),

                    _buildRoleDropDownMenu(context),
                    SizedBox(height: 27.v),

                    if (isTeacherSelected) ...[
                      _buildPrice(context),
                      SizedBox(height: 27.v),
                      _buildDestination(context),
                      SizedBox(height: 27.v),
                      _buildCategoryDropdown(context),
                      SizedBox(height: 27.v),
                      Visibility(
                        visible: isCategorySelected,
                        child: Column(
                          children: [
                            _buildProfessionDropdown(context),
                            SizedBox(height: 27.v),
                          ]
                        )
                      ),
                      _buildInfo(context),
                      SizedBox(height: 27.v),
                    ],
                   
                    SizedBox(height: 6.v),
                    _buildCreateAccountButton(context),
                    SizedBox(height: 6.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildLoginButtonRow(context),
      ),
    );
  }

  /// First Name
  Widget _buildNameEditText(BuildContext context) {
    return TextFieldStateful(
      width: 210.h,
      controller: nameEditTextController,
      hintText: "First Name",
      prefix: Icon(Icons.person, size: 25),
      suffix: IconButton(
        onPressed: () => nameEditTextController.clear(),
        icon: Icon(Icons.clear, size: 25)
      ),
    );
  }

  /// Last Name
  Widget _buildLastNameEditText(BuildContext context) {
    return TextFieldStateful(
      width: 210.h,
      controller: lastNameEditTextController,
      hintText: "Last Name",
      prefix: Icon(Icons.person, size: 25),
      suffix: IconButton(
        onPressed: () => lastNameEditTextController.clear(),
        icon: Icon(Icons.clear, size: 25)
      ),
    );
  }

  /// Email
  Widget _buildEmailEditText(BuildContext context) {
    return TextFieldStateful(
      width: 210.h,
      controller: emailEditTextController,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
      prefix: Icon(Icons.email, size: 25),
      suffix: IconButton(
        onPressed: () => emailEditTextController.clear(),
        icon: Icon(Icons.clear, size: 25)
      ),
    );
  }

  /// Password
  Widget _buildPasswordEditText(BuildContext context) {
    return TextFieldStateful(
      width: 210.h,
      controller: passwordEditTextController,
      hintText: "Password ",
      prefix: Icon(Icons.lock, size: 25),
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
    );
  }

  ///Role
  Widget _buildRoleDropDownMenu(BuildContext context) {
    return CustomDropDownList (
      width: 210.h,
      hintText: 'Role',
      prefix: Icon(Icons.person, size: 25),
      suffix: Icon(Icons.arrow_drop_down, size: 30),
      controller: roleController,
      itemList: dropdownItemList,
    );
  }
   
  ///PPH
  Widget _buildPrice (BuildContext context) {
    return TextFieldStateful(
      width: 210.h,
      controller: priceController,
      hintText: "Price/hour",
      textInputType: TextInputType.number,
      prefix: Icon(Icons.euro, size: 25),
      suffix: IconButton(
        onPressed: () => priceController.clear(),
        icon: Icon(Icons.clear, size: 25)
      ),
    );
  }

  ///Radius
  Widget _buildDestination (BuildContext context) {
    return TextFieldStateful(
      width: 210.h,
      controller: radiusController,
      hintText: "Radius (km)",
      textInputType: TextInputType.number,
      prefix: Icon(Icons.flag, size: 25),
      suffix: IconButton(
        onPressed: () => radiusController.clear(),
        icon: Icon(Icons.clear, size: 25)
      ),
    );
  }

  ///Category
  Widget _buildCategoryDropdown(BuildContext context) {
    return CustomDropDownList (
      width: 210.h,
      hintText: 'Category',
      prefix: Icon(Icons.category_rounded, size: 25),
      suffix: Icon(Icons.arrow_drop_down, size: 30),
      controller: categoryController,
      itemList: categoriesDropDownList,
    );
  }

  ///Profession
  Widget _buildProfessionDropdown(BuildContext context) {
    return CustomDropDownList (
      width: 210.h,
      hintText: 'Profession',
      prefix: Icon(Icons.business_center, size: 25),
      suffix: Icon(Icons.arrow_drop_down, size: 30),
      controller: professionController,
      itemList: professionDropDownList,
    );
  }

  ///Information
  Widget _buildInfo(BuildContext context) {
    return TextFieldStateful(
      width: 210.h,
      hintText: '*Type more info (not required)',
      hintStyle: TextStyle(fontSize: 10.fSize, fontFamily: 'Roboto'),
      controller: infoController,
      maxLines: null,
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.newline,
    );
  }

  /// Create Account Button
  Widget _buildCreateAccountButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: enableSignUp
      ? () {
        _createAccount();
      } :null,
      icon: Icon(
        Icons.add,
        size: 25,
      ),
      label: Text(
          "Create Account",
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
        fixedSize: Size(200, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.circleBorder20,
        ),
      ),
    );
  }

  /// Login Button
  Widget _buildLoginButtonRow(BuildContext context) {
    return Container(
      height: 56,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?",
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
                  onTapTxtLogin(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: Colors.transparent,)
                ),
                child: Text (
                  "LogIn",
                  style: TextStyle(
                    fontSize: 16.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  )
                ),
              )
            ],
          ),]
        )
      )
    );
  }

  /// SnackBar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _buildErrorSnackBar(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 6,
        backgroundColor: Colors.white,
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
                  'Ουπς! Κάτι πήγε λάθος.\nΠαρακαλώ, ελέγξτε τα στοιχεία σας!',
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

  onTapTxtLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginPageScreen);
  }
}