import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_bottom_bar_teacher.dart';
import 'package:login/widgets/appbarfortutors.dart';


class FaqsScreenTutor extends StatelessWidget {
  const FaqsScreenTutor({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppWidgets.buildAppBar2(context),
        drawer: AppWidgets.buildDrawer2(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 16.h,
            top: 94.v,
            right: 16.h,
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "FAQs",
                  style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 40.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 66.v),
              Text(
                "Μπορώ να επικοινωνήσω με τον μαθητή;",
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
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
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
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

  Widget _buildBottomBar2(BuildContext context) {
    return CustomBottomBar2(onChanged: (BottomBarEnum2 type) {
    });
  }
}
