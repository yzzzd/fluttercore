import 'package:flutter_core/api/core_api_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, fieldRename: FieldRename.snake)
class ApiDataResponse<T> extends CoreApiResponse {
  
  final String message;
  final T? data;

  ApiDataResponse(this.message, this.data);

  factory ApiDataResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ApiDataResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$ApiDataResponseToJson(this, toJsonT);

}
