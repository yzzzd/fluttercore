import 'package:flutter_core/api/api_code.dart';
import 'package:json_annotation/json_annotation.dart';

class CoreApiResponse {
  @JsonKey(includeFromJson: false, includeToJson: false)
  int code = ApiCode.success;

  bool successed() => code == ApiCode.success;
  bool unauthorized() => code == ApiCode.unauthorized;
}
