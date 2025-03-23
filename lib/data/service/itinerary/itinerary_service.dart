import 'package:test_wizh/constant/api_constant.dart';
import 'package:test_wizh/data/model/itinerary_model.dart';
import 'package:test_wizh/data/service/itinerary/itinerary_service_impl.dart';
import 'package:test_wizh/settings/api.dart';

class ItineraryService extends ItineraryServiceImpl {
  @override
  Future<List<ItineraryModel>> getItineraries(int id) async {
    var list = await APICall.loadJson(ApiConstant().getItenerary);
    return list.map((item) => ItineraryModel.fromJson(item)).toList();
  }
}
