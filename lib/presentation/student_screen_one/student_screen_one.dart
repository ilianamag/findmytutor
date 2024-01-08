import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_drop_down.dart';
import 'package:login/widgets/custom_icon_button.dart';
import 'package:login/widgets/custom_outlined_button.dart';
import 'package:login/widgets/custom_text_form_field.dart';

class StudentoneScreen extends StatelessWidget {
  StudentoneScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController lastNameEditTextController = TextEditingController();

  TextEditingController emailEditTextController = TextEditingController();

  TextEditingController passwordEditTextController = TextEditingController();

  List<String> dropdownItemList = [
    "Student",
    "Teacher",
  ];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
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
                      child: CustomDropDown(
                        width: 180.h,
                        icon: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 8.v, 9.h, 7.v),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgIcon,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                        hintText: "Role",
                        items: dropdownItemList,
                        prefix: Container(
                          margin: EdgeInsets.fromLTRB(8.h, 8.v, 16.h, 7.v),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgLock,
                            height: 24.adaptSize,
                            width: 20.adaptSize,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: 39.v,
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(height: 69.v),
                    _buildCreateAccountButton(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildSignUpButtonRow(context),
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
          imagePath: ImageConstant.imgIconsMailoutline,
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
      // suffix: Container(
      //   margin: EdgeInsets.fromLTRB(30.h, 16.v, 11.h, 16.v),
      //   child: CustomImageView(
      //     imagePath: ImageConstant.imgEye,
      //     height: 24.adaptSize,
      //     width: 24.adaptSize,
      //   ),
      // ),
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

  /// Section Widget
  Widget _buildCreateAccountButton(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: () {
      onTapStateLayer(context);
      },
      width: 163.h,
      text: "Create Account",
      leftIcon: Container(
        margin: EdgeInsets.only(right: 8.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgArrowright,
          height: 18.adaptSize,
          width: 18.adaptSize,
        ),
      ),
    );
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
              color: appTheme.red900,
              fontSize: 14.fSize,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
    onTapStateLayer(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.studentProfileContainerScreen);
  }
}
