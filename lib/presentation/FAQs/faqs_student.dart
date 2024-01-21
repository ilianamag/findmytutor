import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/appbar.dart';
class FaqsScreen extends StatelessWidget {
  const FaqsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppWidgets.buildAppBar(context),
        drawer: AppWidgets.buildDrawer(context), 
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
                  "Πώς μπορώ να επικοινωνήσω με έναν tutor;",
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
                    "Η επικοινωνία με κάποιον tutor για τον οποίο ενδιαφέρεται κανείς μπορεί εύκολα να γίνει μέσω της αποστολής email σε αυτόν. Αυτό επιτυγχάνεται μέσω του κουμπιού ‘Send an Email’ που βρίσκουμε τόσο στο Profile του tutor όσο και στο στην καρτέλα ‘My Favourites’(εφόσον ο tutor έχει προστεθεί στα αγαπημένα) μέσω του πατήματος των τριών τελειών στα δεξιά ή και με παρατεταμένο πάτημα της κάρτας του καθηγητή.",
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
                    "Σε τι χρησιμεύει το QR scanner και πώς το αξιοποιώ;",
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 16.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 21.v),
                Container(
                  width: 306.h,
                  margin: EdgeInsets.only(right: 21.h),
                  child: Text(
                    "Ο κάθε tutor έχει ένα δικό του QR code το οποίο, όταν σκανάρεται, μας παραπέμπει στο profile του tutor προκειμένου να λάβουμε περισσότερες πληροφορίες για αυτόν κλπ. Εφόσον κάποιος tutor μας έχει δώσει την κάρτα του με το QR του(και άρα έχει profile στην εφαρμογή), ο μαθητής επιλέγοντας το QR code scanner από το side bar μπορεί να το σκανάρει και να κατευθυνθεί στο επιθυμητό profile.",
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
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

   Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
    });
  }
}