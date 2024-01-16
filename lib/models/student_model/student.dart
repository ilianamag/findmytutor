class Student {
  String email;
  String password;
  String firstname;
  String lastname;
  String profilepic;


  Student (
    this.email,
    this.password,
    this.firstname,
    this.lastname,
    this.profilepic
  );

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    json["email"],
    json["password"],
    json["firstname"],
    json["lastname"],
    json["profilepic"]
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'firstname': firstname,
    'lastname': lastname,
    'profilepic': profilepic,
  };

}