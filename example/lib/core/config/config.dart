import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static get baseUrl => dotenv.env['BASE_URL'];
  static get basicAuthUsername => dotenv.env['BASIC_AUTH_USERNAME'];
  static get basicAuthPassword => dotenv.env['BASIC_AUTH_PASSWORD'];
  static get networkTimeout => const Duration(seconds: 60);
}
