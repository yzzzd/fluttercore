import 'package:flutter_core/api/core_api_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse extends CoreApiResponse {

  @JsonKey(name: 'message')
  String message;

  ApiResponse(this.message);

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
  
}