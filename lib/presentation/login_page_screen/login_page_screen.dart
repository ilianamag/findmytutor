import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_elevated_button.dart';
import 'package:login/widgets/custom_text_form_field.dart';

// γειααααα
class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                    CustomImageView(
                      imagePath: ImageConstant.imgLogo1,
                      height: 124.v,
                      width: 137.h,
                      radius: BorderRadius.circular(
                        32.h,
                      ),
                    ),
                    SizedBox(height: 72.v),
                    CustomTextFormField(
                      width: 210.h,
                      controller: emailController,
                      hintText: "Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 35.v),
                    CustomTextFormField(
                      width: 210.h,
                      controller: passwordController,
                      hintText: "Password",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      // suffix: Container(
                      //   margin: EdgeInsets.fromLTRB(30.h, 16.v, 21.h, 16.v),
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
                    ),
                    SizedBox(height: 22.v),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 66.h),
                      decoration: AppDecoration.outlineBlack,
                      child: Container(
                        decoration: AppDecoration.outlineGrayE.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder20,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 10.v,
                          ),
                          decoration: AppDecoration.fillBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder20,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Opacity(
                                opacity: 0.38,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgArrowRight,
                                  height: 18.adaptSize,
                                  width: 18.adaptSize,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8.h,
                                  top: 2.v,
                                  right: 8.h,
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: appTheme.gray90001,
                                    fontSize: 14.fSize,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 43.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 80.h,
                              top: 9.v,
                              bottom: 10.v,
                            ),
                            child: Text(
                              "Don’t have an account? ",
                              style: TextStyle(
                                color: appTheme.black900,
                                fontSize: 16.fSize,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          CustomElevatedButton(
                            onPressed: () {
                            onTapTxtSignUp(context);
                            },
                            width: 62.h,
                            text: "Sign up",
                          ),
                        ],
                      ),
                    ),
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
  // /// Navigates to the signupPageScreen when the action is triggered.
  onTapTxtSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.studentoneScreen);
  }
}
