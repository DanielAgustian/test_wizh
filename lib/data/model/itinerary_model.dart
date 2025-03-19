
class ItineraryModel {
  final String date;
  final List<ItineraryDetailModel> details;

  ItineraryModel({required this.date, required this.details});

  // Factory constructor for JSON deserialization
  factory ItineraryModel.fromJson(Map<String, dynamic> map) {
    return ItineraryModel(
      date: map['date'] as String,
      details: (map['details'] as List<dynamic>)
          .map((item) => ItineraryDetailModel.fromJson(item))
          .toList(),
    );
  }

  // Convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'details': details.map((detail) => detail.toJson()).toList(),
    };
  }
}

class ItineraryDetailModel {
  final String hour;
  final String placeName;
  final String? placeDescription;

  ItineraryDetailModel({
    required this.hour,
    required this.placeName,
    required this.placeDescription,
  });
  factory ItineraryDetailModel.fromJson(Map<String, dynamic> map) {
    return ItineraryDetailModel(
      hour: map["hour"],
      placeName: map["place_name"],
      placeDescription: map["place_description"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "hour": hour,
      "place_name": placeName,
      "place_description": placeDescription,
    };
  }
}
