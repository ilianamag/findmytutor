import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';

class CustomBottomBar2 extends StatefulWidget {
  CustomBottomBar2({this.onChanged});

  Function(BottomBarEnum2)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar2> {
  int selectedIndex = 0;
  
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavMyStudents,
      activeIcon: ImageConstant.imgNavMyStudents,
      title: "My Students",
      type: BottomBarEnum2.Mystudents,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "Profile",
      type: BottomBarEnum2.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.v,
      decoration: BoxDecoration(
        color: appTheme.deepOrange50,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: buildMenuItem(bottomMenuList[index], index == selectedIndex),
            activeIcon: buildMenuItem(bottomMenuList[index], true),
            label: '',
          );
        }),
        onTap: (index) {
          setState(() {
         selectedIndex = index;   
          });
          widget.onChanged?.call(bottomMenuList[index].type);

          switch (bottomMenuList[index].type) {
            case BottomBarEnum2.Mystudents:
              Navigator.pushReplacementNamed(context, AppRoutes.studentsTutorProfileoneScreen);
              break;
            case BottomBarEnum2.Profile:
              Navigator.pushReplacementNamed(
                  context, AppRoutes.tutorProfilePage);
              break;
          }
          setState(() {});
        },
        
      ),
    );
  }

 Widget buildMenuItem(BottomMenuModel item, bool isActive) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.circleBorder16,
          color: isActive ? appTheme.deepOrange50 : Colors.transparent,
        ),
        child: CustomImageView(
          imagePath: isActive ? item.activeIcon : item.icon,
          height: 24.adaptSize,
          width: 24.adaptSize,
          color: isActive ? appTheme.gray90001 : appTheme.gray800,
          margin: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 4.v,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 4.v),
        child: Text(
          item.title ?? "",
          style: TextStyle(
            color: isActive ? appTheme.gray900 : appTheme.gray800,
            fontSize: 12.fSize,
            fontFamily: 'Roboto',
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
}


enum BottomBarEnum2 {
  Mystudents,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum2 type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}