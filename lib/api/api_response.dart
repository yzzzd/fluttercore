import 'package:flutter_core/api/api_code.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  @JsonKey(includeFromJson: false, includeToJson: false)
  int code = ApiCode.success;
  @JsonKey(name: 'message')
  final String message;

  ApiResponse(this.message);

  bool successed() => code == ApiCode.success;
  bool unauthorized() => code == ApiCode.unauthorized;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  /* factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ApiResponseFromJson(json, fromJsonT); */

  /* Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$ApiResponseToJson(this, toJsonT); */
}
