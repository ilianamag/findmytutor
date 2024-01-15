import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_drop_down.dart';
import 'package:login/widgets/custom_text_form_field.dart';
import 'package:login/widgets/custom_icon_button.dart';
import 'package:login/widgets/custom_outlined_button.dart';
import 'package:uuid/uuid.dart';


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
  String? selectedCategory;
  String? selectedSpecialization;
  
  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController lastNameEditTextController = TextEditingController();

  TextEditingController emailEditTextController = TextEditingController();

  TextEditingController passwordEditTextController = TextEditingController();

  TextEditingController priceController= TextEditingController();

 List<String> dropdownItemList = [
    "Student",
    "Teacher",
  ];

  TextEditingController destinationController = TextEditingController();

  bool isTeacherSelected = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, List<String>> categories = {
    'Παιδαγωγός': [],
    'Δευτεροβάθμιας Εκπαίδευσης': ['ΑΟΘ', 'Βιολόγος', 'Χημικός', 'Μαθηματικός', 'Πληροφορικής', 'Φιλόλογος', 'Φυσικός', 'Χημικός', 'Άλλο'],
    'Αθλητισμός': ['Γιόγκα', 'Πιλάτες', 'Τέννις', 'TRX', 'Κρόσφιτ', 'Άλλο'],
    'Μουσική': ['Ακορντεόν', 'Βιολί', 'Γκάιντα', 'Κιθάρα', 'Λύρα', 'Μπάσο', 'Μπουζούκι', 'Ντραμς', 'Όμποε', 'Σαξόφωνο', 'Τρομπόνι', 'Άλλο'],
    'Χορός' : ['Λάτιν', 'Σάλσα', 'Τανγκό', 'Χορός της Κοιλιάς', 'Άλλο'],
    'Ξένες Γλώσσες' : ['Αγγλικών', 'Γαλλικών','Γερμανικών', 'Ισπανικών', 'Ιταλικών', 'Άλλο'],
  };

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
              key: _formKey,
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
                    SizedBox(height: 36.v),
                   
                    Padding(
                    padding: EdgeInsets.only(left: 17.h),
                    child: Column(
                      children: [
                        CustomDropDown(
                           width: 180.h,
                           icon: Container(
                           margin: EdgeInsets.fromLTRB(30.h, 8.v, 9.h, 7.v),
                           child: CustomImageView(
                           height: 24.adaptSize,
                           width: 24.adaptSize,
                          ),
                        ),
                        hintText: "Role",
                        items: dropdownItemList,
                        prefix: Container(
                        margin: EdgeInsets.fromLTRB(8.h, 8.v, 16.h, 7.v),
                        child: CustomImageView(
                        height: 24.adaptSize,
                        width: 20.adaptSize,
                        ),
                       ),
                     prefixConstraints: BoxConstraints(
                    maxHeight: 39.v,
                    ),
                   onChanged: (value) {
                    setState(() {
                    isTeacherSelected = value == "Teacher";
                    });
                    },
                ),

      if (isTeacherSelected) ...[
        SizedBox(height: 5.v),
        _buildPrice(context),
        SizedBox(height: 36.v),
        _buildDestination(context),
        SizedBox(height: 36.v),
        _buildProfessionDropdown(),
        SizedBox(height: 36.v),
      ],
    ],
  ),
),
                    SizedBox(height: 6.v),
                    _buildCreateAccountButton(context),
                    SizedBox(height: 5.v),
                    _buildSignUpButtonRow(context) ,
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return CustomTextFormField(
      width: 210.h,
      controller: nameEditTextController,
      hintText: "Name",
    );
  }

  /// Section Widget
  Widget _buildLastNameEditText(BuildContext context) {
    return CustomTextFormField(
      width: 210.h,
      controller: lastNameEditTextController,
      hintText: "Last Name",
    );
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return CustomTextFormField(
      width: 210.h,
      controller: emailEditTextController,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
      prefix: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 16.v,
        ),
        child: CustomImageView(
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 56.v,
      ),
      contentPadding: EdgeInsets.only(
        top: 18.v,
        right: 30.h,
        bottom: 18.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordEditText(BuildContext context) {
    return CustomTextFormField(
      width: 210.h,
      controller: passwordEditTextController,
      hintText: "Password ",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      suffixConstraints: BoxConstraints(
        maxHeight: 56.v,
      ),
      obscureText: true,
      contentPadding: EdgeInsets.only(
        left: 16.h,
        top: 18.v,
        bottom: 18.v,
      ),
    );
  }
   
Widget _buildPrice (BuildContext context) {
    return CustomTextFormField(
      width: 210.h,
      controller: priceController,
      hintText: "Price/hour ",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      suffixConstraints: BoxConstraints(
        maxHeight: 56.v,
      ),
      obscureText: true,
      contentPadding: EdgeInsets.only(
        left: 10.h,
        top: 18.v,
        bottom: 18.v,
      ),
    );
  }

Widget _buildDestination (BuildContext context) {
    return CustomTextFormField(
      width: 210.h,
      controller: priceController,
      hintText: "Destination (km)",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      suffixConstraints: BoxConstraints(
        maxHeight: 56.v,
      ),
      obscureText: true,
      contentPadding: EdgeInsets.only(
        left: 10.h,
        top: 18.v,
        bottom: 18.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildCreateAccountButton(BuildContext context) {
  return CustomOutlinedButton(
    onPressed: () {
      if (isTeacherSelected) {
        String tutorId = generateUniqueTutorId();
        String name = nameEditTextController.text;
        String email = emailEditTextController.text;
        String qrCodeData = generateQRCodeData(tutorId, name, email);
        //gia na ta kanei save
        saveTutorToDatabase(
          tutorId: tutorId,
          name: name,
          email: email,
          password: passwordEditTextController.text,
          qrCodeData: qrCodeData,
        );

        // Navigate to tutor profile page
        Navigator.pushNamed(context, AppRoutes.tutorProfilePage, arguments: qrCodeData);
      } else {
        // Navigate to student profile page
        Navigator.pushNamed(context, AppRoutes.studentProfileScreen);
      }
    },
    width: 163.h,
    text: "Create Account",
    leftIcon: Container(
      margin: EdgeInsets.only(right: 8.h),
      child: CustomImageView(
        height: 18.adaptSize,
        width: 18.adaptSize,
      ),
    ),
  );
}

String generateUniqueTutorId() {
  final Uuid uuid = Uuid();
  return uuid.v4();
}

String generateQRCodeData(String tutorId, String name, String email) {
  return "TutorID: $tutorId\nName: $name\nEmail: $email";
}

void saveTutorToDatabase({
  required String tutorId,
  required String name,
  required String email,
  required String password,
  required String qrCodeData,
}) {
  // Implement logic to save the tutor's data to your database
  // You can use a database package like 'sqflite' or 'firebase' for this purpose
  // For example, you can use Firebase Firestore:
  // FirebaseFirestore.instance.collection('tutors').doc(tutorId).set({
  //   'name': name,
  //   'email': email,
  //   'password': password,
  //   'qrCodeData': qrCodeData,
  // });
  print("Saving tutor data to the database...");
}
  /// Section Widget
  Widget _buildSignUpButtonRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 67.h,
        right: 67.h,
        bottom: 30.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account? ",
            style: TextStyle(
              color: appTheme.black900,
              fontSize: 16.fSize,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "Sign In",
            style: TextStyle(
              fontSize: 14.fSize,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildProfessionDropdown() {
    return Column(
      children: [
        // Category Dropdown
        DropdownButton<String>(
          hint: Text('Select Category'),
          value: selectedCategory,
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue;
              selectedSpecialization = null;
            });
          },
          items: categories.keys.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
        ),
        SizedBox(height: 16.0),

        // Specialization Dropdown
        if (selectedCategory != null)
          DropdownButton<String>(
            hint: Text('Select Specialization'),
            value: selectedSpecialization,
            onChanged: (String? newValue) {
              setState(() {
                selectedSpecialization = newValue;
              });
            },
            items: categories[selectedCategory!]!
                .map((String specialization) {
              return DropdownMenuItem<String>(
                value: specialization,
                child: Text(specialization),
              );
            }).toList(),
          ),
      ],
    );
  }
  
}