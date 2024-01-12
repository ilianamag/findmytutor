import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/app_bar/appbar_leading_image.dart';
import 'package:login/widgets/app_bar/appbar_title.dart';
import 'package:login/widgets/app_bar/appbar_trailing_image.dart';
import 'package:login/widgets/app_bar/custom_app_bar.dart';
import 'package:login/widgets/custom_bottom_bar_teacher.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 16.h,
            top: 94.v,
            right: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "FAQs",
                  style: theme.textTheme.displayMedium,
                ),
              ),
              SizedBox(height: 66.v),
              Text(
                "Μπορώ να επικοινωνήσω με τον μαθητή;",
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 8.v),
              Container(
                width: 309.h,
                margin: EdgeInsets.only(right: 19.h),
                child: Text(
                  "Ναι, πηγαίνοντας στο Messages, μπορείτε να δείτε τα μηνύματα των μαθητών και πατώντας τα να ανοίξετε τη συνομιλία και να επικοινωνήσετε μαζί του.",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              SizedBox(height: 8.v),
              Text(
                "Πώς μπορώ να αποκτήσω QR code?",
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 7.v),
              Container(
                width: 308.h,
                margin: EdgeInsets.only(right: 19.h),
                child: Text(
                  "Πατώντας το Profile στην κάτω μπάρα της οθόνης σας, εμφανίζεται, μεταξύ άλλων, ένα κουμπί “Get my QR”. Πατώντας το εμφανίζεται το όλο-δικό σας QR code!",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
       bottomNavigationBar: _buildBottomBar2(context),
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
          margin: EdgeInsets.fromLTRB(54.h, 19.v, 99.h, 20.v),
        ),
      ],
      styleType: Style.bgFill,
    );
  }
  Widget _buildBottomBar2(BuildContext context) {
    return CustomBottomBar2(onChanged: (BottomBarEnum2 type) {
    });
  }
}
