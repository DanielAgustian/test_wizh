import 'package:test_wizh/data/model/itinerary_model.dart';

abstract class ItineraryServiceImpl {
  Future<List<ItineraryModel>> getItineraries(int id);
}