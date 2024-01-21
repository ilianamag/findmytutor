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
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
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
                  "Πώς θα μπορέσουν οι μαθητές να επικοινωνήσουν μαζί μου;",
                  style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 16.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.v),
                Container(
                  width: 310.h,
                  margin: EdgeInsets.only(right: 17.h),
                  child: Text(
                    "Οι μαθητές έχουν την δυνατότητα να επικοινωνήσουν με τον tutor που επιθυμούν μέσω email. Το email που θα τους εμφανίζεται για την συγκεκριμένη επικοινωνία θα είναι το email που ο εκάστοτε tutor έχει δώσει κατά την εγγραφή του στην εφαρμογή και δεν μπορεί να το αλλάξει στην πορεία.",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 16.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 25.v),
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Text(
                    "Πώς δουλεύει το QR code; Πρέπει να κάνω κάτι για να αποκτήσω το δικό μου;",
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 16.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 8.v),
                Container(
                  width: 306.h,
                  margin: EdgeInsets.only(right: 21.h),
                  child: Text(
                    "Όταν κάνει κανείς εγγραφή στην εφαρμογή ως tutor αυτόματα αποκτάει το προσωπικό του QR code. Αυτό μπορεί να το δει και να το κοινοποιήσει εφόσον το επιθυμεί είτε επιλέγοντας απ’ το side bar την επιλογή ‘My QR code’ είτε απ’ το Profile μέσω του κουμπιού ‘Get My QR’.",
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 16.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 25.v),
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Text(
                    "Πότε κάποιος μαθητής εμφανίζεται στην καρτέλα ‘My Students’;",
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 16.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 8.v),
                Container(
                  width: 306.h,
                  margin: EdgeInsets.only(right: 21.h),
                  child: Text(
                    "Ένας μαθητής εμφανίζεται στην λίστα των ‘My Students’ όταν ο ίδιος έχει πατήσει το κουμπί ‘Add to my tutors’ στο profile του tutor που επιθυμεί.",
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 16.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 25.v),
              ],
            ),
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
