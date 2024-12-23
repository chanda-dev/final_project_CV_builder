class Education {
  final String? degree;
  final String college;
  final String collegeCountry;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final String description;
  final String major;

  Education({
    required this.degree,
    required this.college,
    required this.startDateTime,
    required this.description,
    required this.collegeCountry,
    required this.endDateTime,
    required this.major,
  });
}
