/*import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_outlined_button.dart';
import 'package:login/widgets/custom_floating_text_field.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/appbar.dart';

// ignore_for_file: must_be_immutable
class EditProfileOfStudentPage extends StatelessWidget {
  EditProfileOfStudentPage({Key? key})
      : super(
          key: key,
        );

  TextEditingController firstNameFieldController = TextEditingController();

  TextEditingController lastNameFieldController = TextEditingController();

  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppWidgets.buildAppBar(context),
        drawer: AppWidgets.buildDrawer(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 18.h,
                  top: 48.v,
                  bottom: 48.v,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 102.v,
                      width: 110.h,
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
                        ],
                      ),
                    ),
                    SizedBox(height: 15.v),
                    _buildFirstNameField(context),
                    SizedBox(height: 16.v),
                    _buildLastNameField(context),
                    SizedBox(height: 19.v),
                    _buildEmailField(context),
                    SizedBox(height: 19.v),
                    _buildPasswordField(context),
                    SizedBox(height: 46.v),
                    _buildEditButton(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

*/
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/models/student_model/student.dart';
import 'package:login/models/student_model/studentPreferences.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/appbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/widgets/text_field_stateful.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/api_connection/api_connection.dart';
import 'package:login/widgets/custom_icon_button.dart';
class EditProfileOfStudentPage extends StatefulWidget {
  EditProfileOfStudentPage({Key? key}) : super(key: key);

  @override
  _EditProfileOfStudentPageState createState() => _EditProfileOfStudentPageState();
}

class _EditProfileOfStudentPageState extends State<EditProfileOfStudentPage> {
  File _image = File(""); // File to hold the selected or captured image
  final ImagePicker _imagePicker = ImagePicker();

  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController lastNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool pInvisibility = true;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    Student? studentInfo = await RememberStudentPreferences.readStudentInfo();
    firstNameFieldController.text = studentInfo?.firstname ?? "";
    lastNameFieldController.text = studentInfo?.lastname ?? "";
    emailFieldController.text = studentInfo?.email ?? "";
    passwordFieldController.text = studentInfo?.password ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppWidgets.buildAppBar(context),
        drawer: AppWidgets.buildDrawer(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 18.h,
                  top: 48.v,
                  bottom: 48.v,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
  height: 98.v,
  width: 88.h,
  child: Stack(
    alignment: Alignment.bottomRight,
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {
            _openCamera();
          },
          child: Container(
            height: 98.v,
            width: 88.h,
            /*padding: EdgeInsets.symmetric(
              horizontal: 13.h,
              vertical: 9.v,
            ),*/
            decoration: AppDecoration.fillRed.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder45,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _openCamera();
                  },
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: _image.path.isNotEmpty
                        ? Image.file(
                            File(_image.path),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          )
                        : SizedBox(),
                  ),
                ),
                if (_image.path.isEmpty)
                  CustomImageView(
                    imagePath: ImageConstant.imgSettings,
                    height: 80.v,
                    width: 60.h,
                    alignment: Alignment.bottomCenter,
                  ),
              ],
            ),
          ),
        ),
      ),
      CustomIconButton(
                            height: 35.v,
                            width: 35.h,
                            padding: EdgeInsets.all(9.h),
                            alignment: Alignment.bottomRight,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgEdit,
                            ),
                          ),
    ],
  ),
),
     SizedBox(height: 15.v),
                    _buildFirstNameField(context),
                    SizedBox(height: 16.v),
                    _buildLastNameField(context),
                    SizedBox(height: 19.v),
                    _buildEmailField(context),
                    SizedBox(height: 19.v),
                    _buildPasswordField(context),
                    SizedBox(height: 46.v),
                    _buildEditButton(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

 void _openCamera() async {
  final image = await _imagePicker.pickImage(
    source: ImageSource.camera,
  );

  if (image != null) {
    setState(() {
      _image = File(image.path);
    });
  }
}

  /// Section Widget
  Widget _buildFirstNameField(BuildContext context) {
    return TextFieldStateful(
      width: 210.h,
      controller: firstNameFieldController,
      //hintText: "First Name",
      labelText: "First Name",
      labelStyle: TextStyle(
        color: appTheme.gray800,
        fontSize: 16.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      prefix: Icon(Icons.person, size: 25),
      suffix: IconButton(
        onPressed: () => firstNameFieldController.clear(),
        icon: Icon(Icons.clear, size: 25)
      ),
    );
  }

  /// Section Widget
  Widget _buildLastNameField(BuildContext context) {
    return TextFieldStateful(
      width: 210.h,
      controller: lastNameFieldController,
      //hintText: "Last Name",
      labelText: "Last Name",
      labelStyle: TextStyle(
        color: appTheme.gray800,
        fontSize: 16.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      prefix: Icon(Icons.person, size: 25),
      suffix: IconButton(
        onPressed: () => lastNameFieldController.clear(),
        icon: Icon(Icons.clear, size: 25)
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailField(BuildContext context) {
    final focusNode = FocusNode();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          _buildErrorSnackBar(context);
        });
      }
    });
    return TextFieldStateful(
      focusNode: focusNode,
      textStyle: TextStyle(color: appTheme.gray600),
      readOnly: true,
      width: 210.h,
      controller: emailFieldController,
      labelText: "Email",
      labelStyle: TextStyle(
        color: appTheme.gray600,
        fontSize: 16.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      prefix:Icon(Icons.email, size: 25, color: appTheme.gray600,),
    );
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return TextFieldStateful(
      width: 210.h,
      controller: passwordFieldController,
      //hintText: "Password ",
      labelText: "Password",
      labelStyle: TextStyle(
        color: appTheme.gray800,
        fontSize: 16.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
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

  /// Section Widget
  Widget _buildEditButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        _updateInfo();
      },
      icon: Icon(
        Icons.edit,
        size: 25,
      ),
      label: Text(
          "Save Changes",
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
        elevation: 0,
        fixedSize: Size(200, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.circleBorder20,
        ),
      ),
    );
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
                  'Δυστυχώς, δεν μπορείτε\nνα αλλάξετε το email σας!',
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

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _buildErrorSnackBar2(BuildContext context) {
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

  _updateInfo() async {
    var response = await http.post(
      Uri.parse(API.updateStud),
      body: {
        "email": emailFieldController.text.trim(),
        "firstname": firstNameFieldController.text.trim(),
        "lastname": lastNameFieldController.text.trim(),
        "password": passwordFieldController.text.trim(),
        "profilepic": "",
      }
    );

    if (response.statusCode == 200) {
      var resBody;
      print(response.body);
      try{ resBody= jsonDecode(response.body); }
      catch(e) { print(e); }
      
      if (resBody['success'] == true) {
        Student studentInfo = Student.fromJson(resBody["userData"]);
        await RememberStudentPreferences.storeStudentInfo(studentInfo);
        Navigator.pushReplacementNamed(context, AppRoutes.studentProfileScreen);
        _clearTextControllers();
      }
      else _buildErrorSnackBar2(context);
    }
  }

  void _clearTextControllers() {
    firstNameFieldController.clear();
    lastNameFieldController.clear();
    emailFieldController.clear();
    passwordFieldController.clear();
  }
  
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
    });
  }
}

  /* import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_icon_button.dart';
import 'package:login/widgets/custom_outlined_button.dart';
import 'package:login/widgets/custom_floating_text_field.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/appbar.dart';

// ignore_for_file: must_be_immutable
class EditProfileOfStudentPage extends StatelessWidget {
  EditProfileOfStudentPage({Key? key})
      : super(
          key: key,
        );

  TextEditingController firstNameFieldController = TextEditingController();

  TextEditingController lastNameFieldController = TextEditingController();

  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppWidgets.buildAppBar(context),
        drawer: AppWidgets.buildDrawer(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 18.h,
                  top: 48.v,
                  bottom: 48.v,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 102.v,
                      width: 110.h,
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
                        ],
                      ),
                    ),
                    SizedBox(height: 15.v),
                    _buildFirstNameField(context),
                    SizedBox(height: 16.v),
                    _buildLastNameField(context),
                    SizedBox(height: 19.v),
                    _buildEmailField(context),
                    SizedBox(height: 19.v),
                    _buildPasswordField(context),
                    SizedBox(height: 46.v),
                    _buildEditButton(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }*/

