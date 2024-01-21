class API {
  static const String hostConnect = "http://192.168.1.232/find_my_tutor_api";
  static const String hostConnectUser = "$hostConnect/USER";
  static const String hostConnectCategory = "$hostConnect/CATEGORY";
  static const String hostConnectProfession = "$hostConnect/PROFESSION";
  static const String hostConnectStudent = "$hostConnect/STUDENT";
  static const String hostConnectTutor = "$hostConnect/TUTOR";
  static const String hostConnectFavorites = "$hostConnect/FAVORITES";
  static const String hostConnectReviews = "$hostConnect/REVIEWS";
  static const String hostConnectStudTut = "$hostConnect/STUDTUT";

  //signup user
  static const signUp = "$hostConnect/USER/signup.php";
  //login user
  static const login = "$hostConnect/USER/login.php";
  //fetch categories
  static const fCats = "$hostConnect/CATEGORY/fetch_categories.php";
  //remember category
  static const rememberCat = "$hostConnect/CATEGORY/remember_cat.php";
  //fetch professions
  static const fProfs = "$hostConnect/PROFESSION/fetch_professions.php";
  //fetch profession Suggestions
  static const fProfSug = "$hostConnect/PROFESSION/fetch_profession_suggestions.php";
  //search profession
  static const searchProf = "$hostConnect/PROFESSION/search_profession.php";
  //remember category
  static const rememberProf = "$hostConnect/PROFESSION/remember_prof.php";
  //signup student
  static const signUpStud = "$hostConnect/STUDENT/signup.php";
  //login student
  static const loginStud = "$hostConnect/STUDENT/login.php";
  //update student info
  static const updateStud = "$hostConnect/STUDENT/update.php";
  //signup tutor
  static const signUpTut = "$hostConnect/TUTOR/signup.php";
  //login tutor
  static const loginTut = "$hostConnect/TUTOR/login.php";
  //fetch tutor Suggestions
  static const fTutSug = "$hostConnect/TUTOR/fetch_tutor_suggestions.php";
  //fetch tutors of a profession
  static const fTutsOfProf = "$hostConnect/TUTOR/fetch_tutor_professions.php";
  //search tutor
  static const searchTut = "$hostConnect/TUTOR/search_tutor.php";
  //update student info
  static const updateTut = "$hostConnect/TUTOR/update.php";
  //add to favorites
  static const addFavorite = "$hostConnect/FAVORITES/add.php";
  //remove from favorites
  static const removeFavorite = "$hostConnect/FAVORITES/remove.php";
  //fetch favorites
  static const fTutfav = "$hostConnect/FAVORITES/fetch_favorites.php";
  //check if favorite
  static const checkFavorite = "$hostConnect/FAVORITES/check.php";
  //fetch count of reviews
  static const fNoR = "$hostConnect/REVIEWS/count.php";
  //fetch reviews of a Tutor
  static const fRevs = "$hostConnect/REVIEWS/fetch_tutor_reviews.php";
  //publish a review
  static const pRev = "$hostConnect/REVIEWS/publish.php";
  //add to Stud-Tut
  static const addStudTut = "$hostConnect/STUDTUT/add.php";
  //remove from Stud-Tut
  static const removeStudTut = "$hostConnect/STUDTUT/remove.php";
  //check if in Stud-Tut
  static const checkStudTut = "$hostConnect/STUDTUT/check.php";

  static const updateProfile = "$hostConnect/STUDENT/update_profile.php";

  static const myStud = "$hostConnect/TUTOR/my_students.php";
  //search student
  static const searchStud = "$hostConnect/STUDENT/search_student.php";
  //removestudent
  static const removeStud = "$hostConnect/STUDENT/remove_student.php";
  //mytutors
  static const myTut = "$hostConnect/STUDENT/my_tutors.php";
  //removetutor
  static const removeTut = "$hostConnect/STUDENT/remove_tutors.php";

  static const myQr = "$hostConnect/TUTOR/my_qr_generator.php";

}