import 'package:test_wizh/data/model/trips_model.dart';

abstract class TripsServiceImpl{
  Future<List<TripsModel>> getTripsModel();

  TripsModel getTripsDetail(int id);
}