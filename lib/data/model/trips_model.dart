class TripsModel {
  final int id;
  final String title;

  factory TripsModel.fromJson(Map<String, dynamic> map) {
    return TripsModel(
      id: map['id'] as int,
      title: map['title'],
    );
  }

  TripsModel({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
