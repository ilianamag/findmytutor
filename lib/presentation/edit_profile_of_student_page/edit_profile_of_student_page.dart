import 'dart:io';
import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/models/student_model/student.dart';
import 'package:login/models/student_model/studentPreferences.dart';
import 'package:login/presentation/edit3.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/appbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/widgets/text_field_stateful.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/api_connection/api_connection.dart';
import 'package:login/widgets/custom_icon_button.dart';
import 'package:path_provider/path_provider.dart';


class EditProfileOfStudentPage extends StatefulWidget {
  EditProfileOfStudentPage({Key? key}) : super(key: key);

  @override
  _EditProfileOfStudentPageState createState() => _EditProfileOfStudentPageState();
}

class _EditProfileOfStudentPageState extends State<EditProfileOfStudentPage> {
  File _image = File(""); // File to hold the selected or captured image
  final ImagePicker _imagePicker = ImagePicker();
  Student? studentInfo;


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
  studentInfo = await RememberStudentPreferences.readStudentInfo();

  if (studentInfo != null) {
    firstNameFieldController.text = studentInfo!.firstname ?? "";
    lastNameFieldController.text = studentInfo!.lastname ?? "";
    emailFieldController.text = studentInfo!.email ?? "";
    passwordFieldController.text = studentInfo!.password ?? "";

    // Check if there's an updated profile picture in the database
    String? updatedImagePath = await getProfileImagePath(studentInfo!.email);
    if (updatedImagePath != null) {
      setState(() {
        _image = File(updatedImagePath);
      });
    }
  }
}

Future<void> UpdateUserProfilePicture(String userEmail) async {
  //File? imageFile = await pickImageFromGallery();

  String? imagePath = _image?.path;

  if (imagePath != null) {
    await updateProfilePicture(userEmail, imagePath);
  }
}

Future<File?> captureImageFromCamera() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    return await _saveImage(pickedFile.path);
  }

  return null;
}

Future<File?> pickImageFromGallery() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    return await _saveImage(pickedFile.path);
  }

  return null;
}

Future<File> _saveImage(String imagePath) async {
  final appDir = await getApplicationDocumentsDirectory();
  final fileName = DateTime.now().millisecondsSinceEpoch.toString();
  final filePath = "${appDir.path}/$fileName.jpg";

  await File(imagePath).copy(filePath);

  return File(filePath);
}


  Future<String?> getProfileImagePath(String userEmail) async {
  if (studentInfo == null) {
    return null; // or handle the case when studentInfo is null
  }

  final response = await http.get(
    Uri.parse(API.updateStud),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    String? imagePath = data['imagePath'];
    return imagePath;
  } else {
    // Handle errors, e.g., return null or throw an exception
    return null;
  }
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppWidgets.buildAppBar(context),
        drawer: AppWidgets.buildDrawer(context),
        body: SingleChildScrollView( // Wrap with SingleChildScrollView
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
                            child: CircleAvatar(
  radius: 49.0,
  backgroundColor: Colors.pink,
  backgroundImage: _image != null ? FileImage(_image!) : null,
  child: Stack(
    alignment: Alignment.center,
    children: [
      if (_image != null && _image!.path.isNotEmpty)
        ClipOval(
          child: Image.file(
            _image!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      if (_image == null || _image!.path.isEmpty)
  ClipOval(
    child: Container(
      decoration: AppDecoration.fillRed.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder45,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgSettings,
            height: 80.v,
            width: 60.h,
            alignment: Alignment.bottomCenter,
          ),
          FutureBuilder<String?>(
            future: getProfileImagePath(studentInfo?.email ?? ""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data != null
                    ? Image.network(
                        snapshot.data!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : Container();
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    ),
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
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

 /*void _openCamera() async {
  final image = await _imagePicker.pickImage(
    source: ImageSource.camera,
  );

  if (image != null) {
    setState(() {
      _image = File(image.path);
    });
    String imagePath = _image!.path;
  }
}*/

void _openCamera() async {
  final result = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Choose an option"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, "camera");
            },
            child: Text("Camera"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, "gallery");
            },
            child: Text("Gallery"),
          ),
        ],
      );
    },
  );

  if (result != null) {
    if (result == "camera") {
      _captureImageFromCamera();
    } else if (result == "gallery") {
      _pickImageFromGallery();
    }
  }
}

Future<void> _captureImageFromCamera() async {
  final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    _saveImageAndPerformUpdate(pickedFile.path);
  }
}

Future<void> _pickImageFromGallery() async {
  final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    _saveImageAndPerformUpdate(pickedFile.path);
  }
}

void _saveImageAndPerformUpdate(String imagePath) async {
  setState(() {
    _image = File(imagePath);
  });

  // Save image path to the database
  await UpdateUserProfilePicture(emailFieldController.text.trim());
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
        //UpdateUserProfilePicture(emailFieldController.text.trim());
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
      "profilepic": _image != null ? _image.path : "",
    }
  );

  if (response.statusCode == 200) {
    var resBody;
    print(response.body);
    try{ resBody= jsonDecode(response.body); }
    catch(e) { print(e); }

    if (resBody['success'] == true) {
      Student studentInfo = Student.fromJson(resBody["userData"]);

      // Save image path to the database
      await RememberStudentPreferences.storeStudentInfo(studentInfo);

      setState(() {
        // Update the UI with the new profile picture
        _image = File(studentInfo.profilepic ?? "");
      });

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
