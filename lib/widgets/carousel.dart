import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:login/core/app_export.dart';
import 'package:login/models/profession_model/profession.dart';
import 'package:login/models/profession_model/professionPreferences.dart';
import 'package:login/widgets/Triplet/Triplet.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryData> categories = [
    CategoryData(name: 'Μουσική', images: [
      //ImageConstant.imagePathMusic,
      Triplet(ImageConstant.imgbagpipe, 4, 19),
      Triplet(ImageConstant.imgbass, 4, 22),
      Triplet(ImageConstant.imgbouzouki, 4, 23),
      Triplet(ImageConstant.imgdrums, 4, 24),
      Triplet(ImageConstant.imgguitar, 4, 20),
      Triplet(ImageConstant.imglyre, 4, 21),
      Triplet(ImageConstant.imgoboe, 4, 25),
      Triplet(ImageConstant.imgsaxophone, 4, 26),
      Triplet(ImageConstant.imgtrombone, 4, 27),
      Triplet(ImageConstant.imgviolin, 4, 18),
      Triplet(ImageConstant.imgother, 4, 28),
    ]),
    CategoryData(name: 'Χορός', images: [
      Triplet(ImageConstant.imglatin, 5, 29),
      Triplet(ImageConstant.imgsalsa, 5, 30),
      Triplet(ImageConstant.imgtango, 5, 31),
      Triplet(ImageConstant.imgbellydancing, 5, 32),

    ]),
    CategoryData(name: 'Ξένες Γλώσσες', images: [
      Triplet(ImageConstant.imgenglish, 6, 33),
      Triplet(ImageConstant.imgfrench, 6, 34),
      Triplet(ImageConstant.imgitalian, 6 , 37),
      Triplet(ImageConstant.imggerman, 6, 35),
      Triplet(ImageConstant.imgother, 6, 38),
    ]),
    CategoryData(name: 'Αθλητισμός', images: [
      Triplet(ImageConstant.imgyoga, 3, 11),
      Triplet(ImageConstant.imgpilates, 3, 12), 
      Triplet(ImageConstant.imgtennis, 3, 13),
      Triplet(ImageConstant.imgcrossfit, 3, 15),
      Triplet(ImageConstant.imgtrx, 3, 14),
      Triplet(ImageConstant.imgother, 3, 16),
    ]),
    CategoryData(name: 'Μαθήματα', images: [
      Triplet(ImageConstant.imgeconomics, 2, 3),
      Triplet(ImageConstant.imgmathematics, 2, 5),
      Triplet(ImageConstant.imgphysics, 2, 8),
      Triplet(ImageConstant.imgchemistry, 2, 9),
      Triplet(ImageConstant.imgbiology, 2, 4),
      Triplet(ImageConstant.imginformatics, 2, 6), 
      Triplet(ImageConstant.imgphilology, 2, 7),
      Triplet(ImageConstant.imgother, 2, 10),
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
  final List<Triplet<String, int, int>> images;

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
            //autoPlay: true,
            aspectRatio: 16 / 9,
            //autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            //autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.5,
          ),
          items: categoryData.images.map((assetPath) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () async {
                    // Handle the tap on the image (e.g., navigate to a new screen)
                    print("Image tapped: ${assetPath.first}");
                    await RememberProfessionPreferences.storeProfessionInfo(Profession(assetPath.second, assetPath.third));
                    Navigator.pushNamed(context, AppRoutes.searchResultScreen);
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
                      assetPath.first,
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