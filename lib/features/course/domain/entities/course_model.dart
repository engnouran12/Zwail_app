class CourseModel {
  int? id;
  String? name;
  String? image;
  String? description;
  String? language;
  int hours;
  int minutes;
  int weeks;
  String? type;
  double? price;
  List<String>? instructors;

  CourseModel(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.language,
      this.hours = 0,
      this.minutes = 0,
      this.weeks = 0,
      this.type,
      this.price,
      this.instructors});
}
