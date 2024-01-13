import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;
  
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavSearch,
      activeIcon: ImageConstant.imgNavSearch,
      title: "Search",
      type: BottomBarEnum.Search,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavFavourites,
      activeIcon: ImageConstant.imgNavFavourites,
      title: "Favourites",
      type: BottomBarEnum.Favourites,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "Profile",
      type: BottomBarEnum.Profile,
    ),
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
            case BottomBarEnum.Search:
              // Navigator.pushReplacementNamed(context, '/search');
              Navigator.pushReplacementNamed(context, AppRoutes.HomePage);
              break;
            case BottomBarEnum.Favourites:
              Navigator.pushReplacementNamed(
                  context, AppRoutes.myFavouritesScreen);
              break;
            case BottomBarEnum.Profile:
              Navigator.pushReplacementNamed(
                  context, AppRoutes.studentProfileScreen);
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


enum BottomBarEnum {
  Search,
  Favourites,
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

  BottomBarEnum type;
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