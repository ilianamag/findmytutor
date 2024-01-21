class Profession {
  int cat_id;
  int prof_id;


  Profession (
    this.cat_id,
    this.prof_id,
  );

  factory Profession.fromJson(Map<String, dynamic> json) => Profession(
    int.parse(json["cat_id"]),
    int.parse(json["prof_id"]),
  );

  Map<String, dynamic> toJson() => {
    'cat_id': cat_id.toString(),
    'prof_id': prof_id.toString(),
  };

}