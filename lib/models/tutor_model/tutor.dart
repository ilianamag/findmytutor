class Tutor {
  String email;
  String password;
  String firstname;
  String lastname;
  String profilepic;
  int pph;
  int radius;
  String information;
  int cat_id;
  int prof_id;

  Tutor (
    this.email,
    this.password,
    this.firstname,
    this.lastname,
    this.profilepic,
    this.pph,
    this.radius,
    this.information,
    this.cat_id,
    this.prof_id
  );

  factory Tutor.fromJson(Map<String, dynamic> json) => Tutor(
    json["email"],
    json["password"],
    json["firstname"],
    json["lastname"],
    json["profilepic"],
    int.parse(json["pph"]),
    int.parse(json["radius"]),
    json["information"],
    int.parse(json["cat_id"]),
    int.parse(json["prof_id"]),
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'firstname': firstname,
    'lastname': lastname,
    'profilepic': profilepic,
    'pph': pph.toString(),
    'radius': radius.toString(),
    'information': information,
    'cat_id': cat_id.toString(),
    'prof_id': prof_id.toString()
  };

}