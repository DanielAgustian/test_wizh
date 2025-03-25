import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_wizh/data/service/itinerary/itinerary_service.dart';
import 'package:test_wizh/data/service/itinerary/itinerary_service_impl.dart';

final itineraryServiceProvider = Provider<ItineraryServiceImpl>((ref) {
  return ItineraryService();
});