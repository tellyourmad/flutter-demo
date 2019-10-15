import 'package:json_annotation/json_annotation.dart';

part 'basic_dto.g.dart';

@JsonSerializable()
class BasicDTO<T> {
  @JsonKey(ignore: true)
  T data;

  final String msg;

  final bool success;

  final int total;

  BasicDTO({
    this.data,
    this.msg,
    this.success,
    this.total,
  });

  get responseData {
    return this.data;
  }

  String get message {
    if (success) {
      return this.msg ?? '成功';
    } else {
      return this.msg ?? '失败';
    }
  }

  int get pageTotal {
    return this.total;
  }

  factory BasicDTO.fromJson(Map<String, dynamic> json) {
    BasicDTO result = _$BasicDTOFromJson(json);
    result.data = json['data'] as T;
    return result;
  }
}
