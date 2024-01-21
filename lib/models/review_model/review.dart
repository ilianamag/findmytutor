class Review {
  String stud_email;
  String tut_email;
  int rating;
  String comment;
  String studentFullname;
  String tutorFullname;
  String studProfilePic;
  String tutProfilePic;


  Review (
    this.stud_email,
    this.tut_email,
    this.rating,
    this.comment,
    this.studentFullname,
    this.tutorFullname,
    this.studProfilePic,
    this.tutProfilePic,
  );

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    json["stud_email"],
    json["tut_email"],
    int.parse(json["rating"]),
    json["comment"],
    json["studentFullname"],
    json["tutorFullname"],
    json["studProfilePic"],
    json["tutProfilePic"],
  );

  Map<String, dynamic> toJson() => {
    'stud_email': stud_email,
    'tut_email': tut_email,
    'rating': rating.toString(),
    'comment': comment,
    'studentFullname': studentFullname,
    'tutorFullname': tutorFullname,
    'studProfilePic': studProfilePic,
    'tutProfilePic': tutProfilePic,
  };

}