import 'package:flutter_core/core.dart';

part 'auth.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Auth {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final String refreshToken;
  final String scope;

  Auth(this.accessToken, this.tokenType, this.expiresIn, this.refreshToken, this.scope);

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}