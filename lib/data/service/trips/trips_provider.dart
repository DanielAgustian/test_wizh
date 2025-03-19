import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_wizh/data/service/trips/trips_service.dart';
import 'package:test_wizh/data/service/trips/trips_service_impl.dart';

final tripServiceProvider = Provider<TripsServiceImpl>((ref){
  return TripsService();
});