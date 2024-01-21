import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/api_connection/api_connection.dart';
import 'package:login/core/app_export.dart';
import 'package:login/models/tutor_model/tutor.dart';
import 'package:login/models/tutor_model/tutorPreferences.dart';
import 'package:login/widgets/custom_drop_down_menu.dart';
import 'package:login/widgets/custom_bottom_bar_teacher.dart';
import 'package:login/widgets/text_field_stateful.dart';
import 'package:login/presentation/edit3.dart';
//import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/appbarfortutors.dart';

// ignore_for_file: must_be_immutable
class TutorEditProfilePage extends StatefulWidget {
  TutorEditProfilePage({Key? key}): super(key: key,);

  @override
  State<TutorEditProfilePage> createState() => _TutorEditProfilePageState();
}

class _TutorEditProfilePageState extends State<TutorEditProfilePage> {
  File _image = File(""); // File to hold the selected or captured image
  final ImagePicker _imagePicker = ImagePicker();
  Tutor? tutorInfo;

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController pphController = TextEditingController();

  TextEditingController radiusController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  TextEditingController professionController = TextEditingController();
  
  TextEditingController informationController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool pInvisibility = true;

  List<String> categoriesDropDownList = [];

  List<String> professionDropDownList = [];

  //FocusNodes
  late FocusNode firstNameFocusNode;
  late FocusNode lastNameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode pphFocusNode;
  late FocusNode radiusFocusNode;
  late FocusNode informationFocusNode;

  @override
  void initState() {
    super.initState();
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    pphFocusNode = FocusNode();
    radiusFocusNode = FocusNode();
    informationFocusNode = FocusNode();
    categoryController.addListener(_fetchProfessions);
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        setState(() {
          _buildErrorSnackBar(context);
        });
      }
    });
    _initializeCatProf();
    _initializeData();
  }

   @override
  void dispose() {
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    pphFocusNode.dispose();
    radiusFocusNode.dispose();
    informationFocusNode.dispose();
    // Remove listeners when the widget is disposed
    categoryController.removeListener(_fetchProfessions);
    super.dispose();
  } 

  Future<void> _initializeCatProf() async {
    Tutor? tutorInfo = await RememberTutorPreferences.readTutorInfo();
    var rest = await http.post(
    Uri.parse(API.rememberCat),
      body: {
        "cat_id": tutorInfo?.cat_id.toString(),
      }
    );
    if (rest.statusCode == 200) {
      var resBody;
      print(rest.body);
      try{
        resBody = jsonDecode(rest.body);
      }
      catch(e) {
        print(e);
      }
      if (resBody['success'] == true) { 
        setState(() {
          categoryController.text = categoryController.text = resBody["userData"]["category"].toString();
        });
      }
    }
    rest = await http.post(
    Uri.parse(API.rememberProf),
      body: {
        "prof_id": tutorInfo?.prof_id.toString(),
      }
    );
    if (rest.statusCode == 200) {
      var resBody;
      print(rest.body);
      try{
        resBody = jsonDecode(rest.body);
      }
      catch(e) {
        print(e);
      }
      if (resBody['success'] == true) { 
        setState(() {
          resBody = jsonDecode(rest.body);
          professionController.text = resBody["userData"]["profession"].toString();
        });
      }
    }
    _fetchCategories();
    _fetchProfessions();
  }

  Future<void> _initializeData() async {
    Tutor? tutorInfo = await RememberTutorPreferences.readTutorInfo();
    firstNameController.text = tutorInfo?.firstname ?? "";
    lastNameController.text = tutorInfo?.lastname ?? "";
    emailController.text = tutorInfo?.email ?? "";
    passwordController.text = tutorInfo?.password ?? "";
    pphController.text = tutorInfo?.pph.toString() ?? "None Specified";
    radiusController.text = tutorInfo?.radius.toString() ?? "None Specified";
    informationController.text = tutorInfo?.information ?? "None Available";
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

  _fetchCategories() async {
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

  _fetchProfessions() async {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector (
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppWidgets.buildAppBar2(context),
          drawer: AppWidgets.buildDrawer2(context),
          body: Center(
            child: SizedBox(
              width: SizeUtils.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 69.h,
                      vertical: 13.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 22.v),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 95.v,
                            width: 106.h,
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
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 27.v),
                              _buildFirstName(context),
                              SizedBox(height: 27.v),
                              _buildLastName(context),
                              SizedBox(height: 27.v),
                              _buildEmail(context),
                              SizedBox(height: 27.v),
                              _buildPassword(context),
                              SizedBox(height: 27.v),
                              _buildPPH(context),
                              SizedBox(height: 27.v),
                              _buildRadius(context),
                              SizedBox(height: 27.v),
                              _buildCategory(context),
                              SizedBox(height: 27.v),
                              _buildProfession(context),
                              SizedBox(height: 27.v),
                              _buildInformation(context),
                              SizedBox(height: 27.v),
                              _buildEditButton(context),
                              SizedBox(height: 5.v),
                            ]
                          ),
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
      ),
          ),
        bottomNavigationBar: _buildBottomBar2(context),
        ),
      ),
    );
  }

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
  await UpdateUserProfilePicture(emailController.text);
}


  /// First Name
  Widget _buildFirstName(BuildContext context) {
    return TextFieldStateful(
      focusNode: firstNameFocusNode,
      width: 210.h,
      controller: firstNameController,
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
        onPressed: () => firstNameController.clear(),
        icon: Icon(Icons.clear, size: 25)
      ),
    );
  }

  /// Last Name
  Widget _buildLastName(BuildContext context) {
    return TextFieldStateful(
      focusNode: lastNameFocusNode,
      width: 210.h,
      controller: lastNameController,
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
        onPressed: () => lastNameController.clear(),
        icon: Icon(Icons.clear, size: 25)
      ),
    );
  }

  /// Email
  Widget _buildEmail(BuildContext context) {
    return TextFieldStateful(
      focusNode: emailFocusNode,
      textStyle: TextStyle(color: appTheme.gray600),
      readOnly: true,
      width: 210.h,
      controller: emailController,
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

  /// Password
  Widget _buildPassword(BuildContext context) {
    return TextFieldStateful(
      focusNode: passwordFocusNode,
      width: 210.h,
      controller: passwordController,
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
   
  ///PPH
  Widget _buildPPH (BuildContext context) {
    return TextFieldStateful(
      focusNode: pphFocusNode,
      width: 210.h,
      controller: pphController,
      //hintText: "Price/hour",
      labelText: "Rrice/hour",
      labelStyle: TextStyle(
        color: appTheme.gray800,
        fontSize: 16.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      textInputType: TextInputType.number,
      prefix: Icon(Icons.euro, size: 25),
      suffix: IconButton(
        onPressed: () => pphController.clear(),
        icon: Icon(Icons.clear, size: 25)
      ),
    );
  }

  ///Radius
  Widget _buildRadius (BuildContext context) {
    return TextFieldStateful(
      focusNode: radiusFocusNode,
      width: 210.h,
      controller: radiusController,
      //hintText: "Radius (km)",
      labelText: "Radius (km)",
      labelStyle: TextStyle(
        color: appTheme.gray800,
        fontSize: 16.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      textInputType: TextInputType.number,
      prefix: Icon(Icons.flag, size: 25),
      suffix: IconButton(
        onPressed: () => radiusController.clear(),
        icon: Icon(Icons.clear, size: 25)
      ),
    );
  }

  ///Category
  Widget _buildCategory(BuildContext context) {
    return CustomDropDownList (
      width: 210.h,
      //hintText: 'Category',
      labelText: "Category",
      labelStyle: TextStyle(
        color: appTheme.gray800,
        fontSize: 16.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      prefix: Icon(Icons.category_rounded, size: 25),
      suffix: Icon(Icons.arrow_drop_down, size: 30),
      controller: categoryController,
      itemList: categoriesDropDownList,
    );
  }

  ///Profession
  Widget _buildProfession(BuildContext context) {
    return CustomDropDownList (
      width: 210.h,
      //hintText: 'Profession',
      labelText: "Profession",
      labelStyle: TextStyle(
        color: appTheme.gray800,
        fontSize: 16.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      prefix: Icon(Icons.business_center, size: 25),
      suffix: Icon(Icons.arrow_drop_down, size: 30),
      controller: professionController,
      itemList: professionDropDownList,
    );
  }

  ///Information
  Widget _buildInformation(BuildContext context) {
    return TextFieldStateful(
      focusNode: informationFocusNode,
      width: 210.h,
      //hintText: '*Type more info (not required)',
      labelText: "Information",
      labelStyle: TextStyle(
        color: appTheme.gray800,
        fontSize: 16.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      prefix: Icon(Icons.info_outline, size: 25),
      suffix: IconButton(
        onPressed: () => informationController.clear(),
        icon: Icon(Icons.clear, size: 25)
      ),
      hintStyle: TextStyle(fontSize: 10.fSize, fontFamily: 'Roboto'),
      controller: informationController,
      maxLines: null,
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.newline,
    );
  }

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

 _updateInfo() async {
  var response = await http.post(
      Uri.parse(API.updateTut),
      body: {
        "email": emailController.text.trim(),
        "firstname": firstNameController.text.trim(),
        "lastname": lastNameController.text.trim(),
        "password": passwordController.text.trim(),
        "profilepic": "",
        "pph": pphController.text.trim(),
        "radius": radiusController.text.trim(),
        "category": categoryController.text.trim(),
        "profession": professionController.text.trim(),
        "information": informationController.text.trim(),
      }
    );

    if (response.statusCode == 200) {
      var resBody;
      print(response.body);
      try{ resBody= jsonDecode(response.body); }
      catch(e) { print(e); }
      
      if (resBody['success'] == true) {
        Tutor tutorInfo = Tutor.fromJson(resBody["userData"]);
        await RememberTutorPreferences.storeTutorInfo(tutorInfo);
        Navigator.pushReplacementNamed(context, AppRoutes.tutorProfilePage);
        _clearTextControllers();
      }
      else _buildErrorSnackBar2(context);
    }
  }

  void _clearTextControllers() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    pphController.clear();
    radiusController.clear();
    categoryController.clear();
    professionController.clear();
    informationController.clear();
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

   Widget _buildBottomBar2(BuildContext context) {
    return CustomBottomBar2(onChanged: (BottomBarEnum2 type) {
    });
  }
}