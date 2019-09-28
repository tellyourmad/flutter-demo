import 'package:app/models/dto/basic_dto.dart';
import 'package:app/repository/request_type.dart';
import 'package:dio/dio.dart';

/// 封装 restful 请求
class RemoteRepo {
  /// 单例，避免重复实例化
  static final RemoteRepo _instance = RemoteRepo._();

  static RemoteRepo get instance => _instance;

  Dio _dio;

  static const String API_PREFIX = 'http://api2.9daye.com.cn/api/v1/client/';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  RemoteRepo._() {
    _dio = Dio()
      ..options.baseUrl = API_PREFIX
      ..options.connectTimeout = CONNECT_TIMEOUT
      ..options.receiveTimeout = RECEIVE_TIMEOUT
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'};

    /// TODO 添加拦截器
  }

  String _getMethodName(RequestType _type) {
    switch (_type) {
      case RequestType.DELETE:
        return 'DELETE';
      case RequestType.POST:
        return 'POST';
      case RequestType.PUT:
        return 'PUT';
      case RequestType.GET:
        return 'GET';
    }
  }

  Future<BasicDTO<T>> request<T>(
    String url, {
    dynamic data = const {},
    RequestType method = RequestType.GET,
  }) async {
    /// restful 请求处理
    /// /gysw/search/hist/:user_id        user_id=27
    /// 最终生成 url 为     /gysw/search/hist/27
    // data.forEach((key, value) {
    //   if (url.indexOf(key) != -1) {
    //     url = url.replaceAll(':$key', value.toString());
    //   }
    // });

    var result;
    try {
      Response response = await _dio.request(
        url,
        data: data,
        options: new Options(
          method: _getMethodName(method),
        ),
      );

      result = BasicDTO.fromJson(response.data);
    } on DioError catch (e) {
      /// TODO 捕捉错误
      /// 将DioError分成NetworkException（网络错误）、AuthException（权限错误）、BizException（业务错误）
    }
    return result;
  }
}
