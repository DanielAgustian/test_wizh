import 'package:test_wizh/data/model/itinerary_model.dart';

abstract class ItineraryServiceImpl {
  List<ItineraryModel> getItineraries(int id);
}