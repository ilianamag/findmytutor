import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/app_bar/appbar_leading_image.dart';
import 'package:login/widgets/app_bar/appbar_title.dart';
import 'package:login/widgets/app_bar/appbar_trailing_button.dart';
import 'package:login/widgets/app_bar/appbar_trailing_image.dart';
import 'package:login/widgets/app_bar/custom_app_bar.dart';
import 'package:login/widgets/custom_icon_button.dart';
import 'package:login/widgets/custom_outlined_button.dart';
import 'package:login/widgets/custom_floating_text_field.dart';
import 'package:login/theme/custom_button_style.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
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
        appBar: _buildAppBar(context),
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

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgMegaphone,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 19.v,
          bottom: 19.v,
        ),
      ),
      title: AppbarTitle(
        text: "FindmyTutor",
        margin: EdgeInsets.only(left: 18.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.fromLTRB(13.h, 13.v, 17.h, 8.v),
           onTap: () {
          Navigator.pushReplacementNamed(context, AppRoutes.studentProfileScreen);
        },
        ),
        AppbarTrailingButton(
          margin: EdgeInsets.only(
            left: 29.h,
            top: 13.v,
            right: 30.h,
          ),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildFirstNameField(BuildContext context) {
    return CustomFloatingTextField(
      width: 210.h,
      controller: firstNameFieldController,
      labelText: "Name",
      labelStyle: TextStyle(
        color: appTheme.gray800,
        fontSize: 12.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      hintText: "Name",
      suffix: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgEditGray90001,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 64.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildLastNameField(BuildContext context) {
    return CustomFloatingTextField(
      width: 210.h,
      controller: lastNameFieldController,
      labelText: "Last Name",
      labelStyle: TextStyle(
        color: appTheme.gray800,
        fontSize: 12.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      hintText: "Last Name",
      suffix: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgEditGray90001,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 64.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailField(BuildContext context) {
    return CustomFloatingTextField(
      width: 210.h,
      controller: emailFieldController,
      labelText: "Email",
      labelStyle: TextStyle(
        color: appTheme.gray800,
        fontSize: 12.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
      prefix: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgIconsMailoutline,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 64.v,
      ),
      suffix: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgEditGray90001,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 64.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return CustomFloatingTextField(
      width: 210.h,
      controller: passwordFieldController,
      labelText: "Password",
      labelStyle: TextStyle(
        color: appTheme.gray800,
        fontSize: 12.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      hintText: "Password",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      suffix: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgEditGray90001,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 64.v,
      ),
      contentPadding: EdgeInsets.fromLTRB(16.h, -7.v, 16.h, 48.v),
    );
  }

  /// Section Widget
  Widget _buildEditButton(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: () {
        onTapTxtSignUp(context);
      },
      height: 40.v,
      width: 72.h,
      text: "Edit",
      buttonStyle: CustomButtonStyles.outlineGrayTL20,
    );
  }
  
  void onTapTxtSignUp(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.studentProfileScreen);
  }
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
    });
  }
}

