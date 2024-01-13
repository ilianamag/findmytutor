import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:login/core/app_export.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryData> categories = [
    CategoryData(name: 'Μουσική', images: [
      //ImageConstant.imagePathMusic,
      ImageConstant.imgbagpipe,
      ImageConstant.imgbass,
      ImageConstant.imgbouzouki,
      ImageConstant.imgdrums,
      ImageConstant.imgguitar,
      ImageConstant.imglyre,
      ImageConstant.imgoboe,
      ImageConstant.imgsaxophone,
      ImageConstant.imgtrombone,
      ImageConstant.imgviolin,
      ImageConstant.imgother,
    ]),
    CategoryData(name: 'Χορός', images: [
      ImageConstant.imglatin,
      ImageConstant.imgsalsa,
      ImageConstant.imgtango,
      ImageConstant.imgbellydancing,
      ImageConstant.imgother,

    ]),
    CategoryData(name: 'Ξένες Γλώσσες', images: [
      ImageConstant.imgenglish,
      ImageConstant.imgfrench,
      ImageConstant.imgitalian,
      ImageConstant.imggerman,
      ImageConstant.imgother,
    ]),
    CategoryData(name: 'Αθλητισμός', images: [
      ImageConstant.imgyoga,
      ImageConstant.imgpilates,
      ImageConstant.imgtennis,
      ImageConstant.imgcrossfit,
      ImageConstant.imgtrx,
      ImageConstant.imgother,
    ]),
    CategoryData(name: 'Μαθήματα', images: [
      ImageConstant.imgeconomics,
      ImageConstant.imgmathematics,
      ImageConstant.imgphysics,
      ImageConstant.imgchemistry,
      ImageConstant.imgbiology,
      ImageConstant.imginformatics,
      ImageConstant.imgphilology,
      ImageConstant.imgother,
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return HomePage(categoryData: categories[index]);
      },
    );
  }
}

class CategoryData {
  final String name;
  final List<String> images;

  CategoryData({required this.name, required this.images});
}

class HomePage extends StatelessWidget {
  final CategoryData categoryData;

  HomePage({required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            categoryData.name,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.5,
          ),
          items: categoryData.images.map((assetPath) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    // Handle the tap on the image (e.g., navigate to a new screen)
                    print("Image tapped: $assetPath");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.asset(
                      assetPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}