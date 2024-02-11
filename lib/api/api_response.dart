import 'package:flutter_core/api/api_code.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'message')
  final String message;

  ApiResponse(this.status, this.message);

  bool successed() => status == ApiCode.success;
  bool unauthorized() => status == ApiCode.unauthorized;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
