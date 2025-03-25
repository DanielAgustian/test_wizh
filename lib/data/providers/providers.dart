import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_wizh/data/model/itinerary_model.dart';
import 'package:test_wizh/data/model/trips_model.dart';
import 'package:test_wizh/data/providers/service_provider/itinerary_provider.dart';
import 'package:test_wizh/data/providers/service_provider/trips_provider.dart';

final getItinerariesProvider =
    FutureProvider.autoDispose.family<List<ItineraryModel>, int>((ref, id) {
  final itineraryService = ref.watch(itineraryServiceProvider);
  return itineraryService.getItineraries(id);
});

final getTripsProvider = FutureProvider.autoDispose<List<TripsModel>>((ref) {
  return ref.watch(tripServiceProvider).getTripsModel();
});

final getTripsDetail =
    FutureProvider.autoDispose.family<TripsModel, int>((ref, id) {
  return ref.watch(tripServiceProvider).getTripsDetail(id);
});


final tabProvider = StateProvider<String>((ref) => "title");
