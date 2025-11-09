class Exam {
  final int id;
  final String name;
  final DateTime date;
  final List<String> places;

  Exam({
    required this.id,
    required this.name,
    required this.date,
    required this.places,
  });

  Exam.fromJson(Map<String, dynamic> data)
    : id = data['id'],
      name = data['name'],
      date = data['date'],
      places = data['places'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'date': date.toIso8601String(),
    'places': places,
  };
}
