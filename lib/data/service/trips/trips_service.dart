import 'package:test_wizh/constant/api_constant.dart';
import 'package:test_wizh/data/model/trips_model.dart';
import 'package:test_wizh/data/service/trips/trips_service_impl.dart';
import 'package:test_wizh/settings/api.dart';

class TripsService implements TripsServiceImpl {
  @override
  Future<List<TripsModel>> getTripsModel() async {
    var list = await APICall.loadJson(ApiConstant().getTrips);
    return list.map((item) => TripsModel.fromJson(item)).toList();
  }

  @override
  TripsModel getTripsDetail(int id) {
    // TODO: implement getTripsDetail
    throw UnimplementedError();
  }
}
