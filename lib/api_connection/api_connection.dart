class API {
  static const String hostConnect = "http://192.168.1.2/find_my_tutor_api";
  static const String hostConnectUser = "$hostConnect/USER";
  static const String hostConnectCategory = "$hostConnect/CATEGORY";
  static const String hostConnectProfession = "$hostConnect/PROFESSION";
  static const String hostConnectStudent = "$hostConnect/STUDENT";
  static const String hostConnectTutor = "$hostConnect/TUTOR";

  //signup user
  static const signUp = "$hostConnect/USER/signup.php";
  //login user
  static const login = "$hostConnect/USER/login.php";
  //fetch categories
  static const fCats = "$hostConnect/CATEGORY/fetch_categories.php";
  //fetch professions
  static const fProfs = "$hostConnect/PROFESSION/fetch_professions.php";
  //fetch profession Suggestions
  static const fProfSug = "$hostConnect/PROFESSION/fetch_profession_suggestions.php";
  //search profession
  static const searchProf = "$hostConnect/PROFESSION/search_profession.php";
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
  //search tutor
  static const searchTut = "$hostConnect/TUTOR/search_tutor.php";
  //myqrgenerator  
  static const myQr = "$hostConnect/TUTOR/my_qr_generator.php";
}