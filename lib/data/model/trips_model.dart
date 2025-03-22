class TripsModel {
  final int id;
  final String title;
  final double rating;
  final int price;
  final String src;

  factory TripsModel.fromJson(Map<String, dynamic> map) {
    return TripsModel(
      id: map['id'] as int,
      title: map['title'] ?? 'No Title',
      rating: map['rating'] == null
          ? 0.0
          : map['rating'] is String
              ? double.parse(map['rating'])
              : map['rating'],
      price: map['price'] == null
          ? 0.0
          : map['price'] is String
              ? int.parse(map['price'])
              : map['price'],
              
      src: map['src'] ?? '',
    );
  }

  TripsModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.price,
    required this.src,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'rating': rating,
      'price': price,
      'src': src
    };
  }
}
