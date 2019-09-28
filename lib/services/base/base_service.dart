
import 'package:app/repository/remote_repo.dart';

/// Service父类，提供公共便捷方法入口
abstract class BaseService {

  RemoteRepo get api {
    return RemoteRepo.instance;
  }

}
