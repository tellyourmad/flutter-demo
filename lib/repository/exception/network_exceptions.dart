/// 网络错误
class NetworkException implements Exception {
  String message;
  int statusCode;

  NetworkException({this.message, this.statusCode});

  @override
  String toString() {
    return message;
  }
}

/// 认证出错
class AuthException extends NetworkException {
  AuthException({message, statusCode}) : super(message: message, statusCode: statusCode);
}

/// 其他业务报错
class BizException extends NetworkException {
  BizException({message, statusCode}) : super(message: message, statusCode: statusCode);
}
