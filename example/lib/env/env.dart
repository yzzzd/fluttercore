import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static final String baseUrl = _Env.baseUrl;
  @EnviedField(varName: 'BASIC_AUTH_USERNAME')
  static final String basicUsername = _Env.basicUsername;
  @EnviedField(varName: 'BASIC_AUTH_PASSWORD')
  static final String basicPassword = _Env.basicPassword;
  static const networkTimeout = Duration(seconds: 60);
}