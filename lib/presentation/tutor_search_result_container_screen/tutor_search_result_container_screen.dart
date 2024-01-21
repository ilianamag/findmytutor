import 'package:flutter/material.dart';
import 'package:login/api_connection/api_connection.dart';
import 'package:login/core/app_export.dart';
import 'package:login/models/profession_model/profession.dart';
import 'package:login/models/profession_model/professionPreferences.dart';
import 'package:login/models/student_model/student.dart';
import 'package:login/models/student_model/studentPreferences.dart';
import 'package:login/models/tutor_model/tutorPreferences.dart';
import 'package:login/models/tutor_model/tutor.dart';
import 'package:login/widgets/Pair/Pair.dart';
import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/collapsed_card.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/appbar.dart' as AppbarWidget;
import 'package:login/widgets/whole_card_search.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchResultScreen extends StatefulWidget {
  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  String _selectedSortOption = 'Best Rated';
  Student? studentInfo;
  Profession? professionInfo;
  List<Pair<Tutor, bool>> tutors = [];

  _initializeData() async{
    professionInfo = await RememberProfessionPreferences.readProfessionInfo();
    print(professionInfo?.cat_id);
    studentInfo = await RememberStudentPreferences.readStudentInfo();
    tutors = await _fetchTutors();
    print('Now Build');  
    _sortTutors();
  }

  Future<List<Pair<Tutor, bool>>> _fetchTutors() async {
    List<Pair<Tutor, bool>> pairListT;
    final rest = await http.post(
      Uri.parse(API.fTutsOfProf),
      body: {
        "cat_id": professionInfo?.cat_id.toString(),
        "prof_id": professionInfo?.prof_id.toString(),
        "stud_email": studentInfo?.email,
      }
    );
    
    if (rest.statusCode == 200) {
      var resBody;
      print(rest.body);
      try{
        resBody = jsonDecode(rest.body);
        List<dynamic> tutorInfo = resBody;
        pairListT = tutorInfo.map((item) {
          Tutor tutor = Tutor.fromJson(item);
          bool isFavorite = item['isFavorite'] ?? false;
          return Pair<Tutor, bool>(
            tutor,
            isFavorite,
          );
        }).toList();
        //List<Tutor> tutors = tutorInfo.map((json) => Tutor.fromJson(json)).toList();
        return pairListT;
      }
      catch(e) {
        print(e);
        return [];
      }
    }
    else {
      print('fcf');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppWidgets.buildAppBar(context),
        drawer: AppWidgets.buildDrawer(context),
        body: FutureBuilder(
          future: _initializeData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print('Build');
              return SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  //padding: EdgeInsets.only(top: 69.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSortDropdown(),
                      if (tutors != null && tutors.isNotEmpty)
                        for (var tutor in tutors)
                          Column(
                            children: [
                              CollapsedProfileCard(
                                email: tutor.first.email,
                                fullname: "${tutor.first.firstname} ${tutor.first.lastname}",
                                pph: tutor.first.pph,
                                information: tutor.first.information,
                                rating: tutor.first.rating,
                                profilepic: tutor.first.profilepic,
                                initFavorite: tutor.second,
                              ),
                              SizedBox(height: 32.0)
                            ]
                          )
                         /* Column(
                            children: [
                              CollapsedProfileCard(
                                email: tutor.first.email,
                                fullname: "${tutor.first.firstname} ${tutor.first.lastname}",
                                pph: tutor.first.pph,
                                information: tutor.first.information,
                                rating: tutor.first.rating,
                                profilepic: tutor.first.profilepic,
                                initFavorite: tutor.second,
                              ),
                              SizedBox(height: 32.0)
                            ]
                          )*/
                        
                      else
                        Center(child: Text('No tutors found.')),
        
                    ],
                  ),
                ),
              );
            } else {
              return Center (child: CircularProgressIndicator());
            }
          }
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildSortDropdown() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 40,
        width: 250,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[800]!), borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sort, size: 25),
            SizedBox(width: 10),
            Text(
              'Sort By:',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16
              ),
            ),
            SizedBox(width: 10),
            DropdownButton<String>(
              value: _selectedSortOption,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSortOption = newValue!;
                  _sortTutors();
                });
              },
              items: ['Best Rated', 'Lowest Price', 'Highest Price']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _sortTutors() {
    switch (_selectedSortOption) {
      case 'Best Rated':
        tutors.sort((a, b) => b.first.rating.compareTo(a.first.rating));
        
        break;
      case 'Lowest Price':
          tutors.sort((a, b) => a.first.pph.compareTo(b.first.pph));
        
        break;
      case 'Highest Price':
        tutors.sort((a, b) => b.first.pph.compareTo(a.first.pph));
        
        break;
    }
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }
}



/*Expanded(
  child: ListView.builder(
    itemCount: _tutors.length,
    itemBuilder: (context, index) {
      Tutor tutor = _tutors[index];
      return Column(
        children: [
          WholeCardSearch(
            context,
            tutorName: tutor.name,
            tutorPrice: tutor.price,
            tutorRating: tutor.rating,
          ),
          SizedBox(height: 16.0),
        ],
      );
    },
  ),
),*/