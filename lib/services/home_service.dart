import 'package:app/models/dto/promotion/feature/feature_dto.dart';
import 'package:app/repository/request_type.dart';
import 'package:app/services/base/base_service.dart';

class HomeService extends BaseService{

  Future<FeatureDTO> getHomePage(int pageIndex,[int pageSize = 10]) async {
    final res = await api.request(
      "promotion-pages/home",
      data:{
        'page': pageIndex,
        'size': pageSize
      },
      method: RequestType.GET,
    );
    return FeatureDTO.fromJson(res.data);
  }

}