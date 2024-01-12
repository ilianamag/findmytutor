import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/app_bar/appbar_leading_image.dart';
import 'package:login/widgets/app_bar/appbar_title.dart';
import 'package:login/widgets/app_bar/appbar_trailing_image.dart';
import 'package:login/widgets/app_bar/custom_app_bar.dart';
import 'package:login/widgets/custom_floating_text_field.dart';
import 'package:login/widgets/custom_icon_button.dart';
import 'package:login/widgets/custom_bottom_bar_teacher.dart';
import 'package:login/widgets/appbarfortutors.dart';
// ignore_for_file: must_be_immutable
class TutorEditProfilePage extends StatelessWidget {
  TutorEditProfilePage({Key? key}): super(key: key,);

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppWidgets.buildAppBar2(context),
        drawer: AppWidgets.buildDrawer2(context),
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
                              child: Container(
                                height: 90.v,
                                width: 92.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 13.h,
                                  vertical: 9.v,
                                ),
                                decoration: AppDecoration.fillRed.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder45,
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
                    ),
                    SizedBox(height: 27.v),
                    _buildFirstName(context),
                    SizedBox(height: 6.v),
                    _buildLastName(context),
                    SizedBox(height: 6.v),
                    _buildEmail(context),
                    SizedBox(height: 6.v),
                    _buildPassword(context),
                    SizedBox(height: 6.v),
                    Container(
                      height: 207.v,
                      width: 210.h,
                      margin: EdgeInsets.only(left: 2.h),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 199.v,
                              width: 210.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  4.h,
                                ),
                                border: Border.all(
                                  color: appTheme.gray600,
                                  width: 1.h,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 71.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.h),
                                    decoration: AppDecoration.fillGray,
                                    child: Text(
                                      "Information",
                                      style: TextStyle(
                                        color: appTheme.gray80001,
                                        fontSize: 12.fSize,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.v),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgEditGray80001,
                                    height: 24.adaptSize,
                                    width: 24.adaptSize,
                                    alignment: Alignment.centerRight,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 11.h,
                                top: 25.v,
                              ),
                              child: Text(
                                "Information",
                                style: TextStyle(
                                  color: appTheme.gray800,
                                  fontSize: 10.fSize,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar2(context),
      ),
    );
  }


  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.h),
      child: CustomFloatingTextField(
        controller: firstNameController,
        labelText: "First Name",
        labelStyle: TextStyle(
          color: appTheme.gray80001,
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        hintText: "First Name",
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
        
      ),
    );
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 11.h,
      ),
      child: CustomFloatingTextField(
        controller: lastNameController,
        labelText: "Last Name",
        labelStyle: TextStyle(
          color: appTheme.gray80001,
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
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 10.h,
      ),
      child: CustomFloatingTextField(
        controller: emailController,
        labelText: "Email",
        labelStyle: TextStyle(
          color: appTheme.gray80001,
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        hintText: "Email",
        textInputType: TextInputType.emailAddress,
        prefix: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgIcon,
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
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 9.h,
      ),
      child: CustomFloatingTextField(
        controller: passwordController,
        labelText: "Password",
        labelStyle: TextStyle(
          color: appTheme.gray80001,
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        hintText: "Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        alignment: Alignment.center,
      ),
    );
  }
   Widget _buildBottomBar2(BuildContext context) {
    return CustomBottomBar2(onChanged: (BottomBarEnum2 type) {
    });
  }
}
