import 'dart:convert';
import 'package:flutter_core/core.dart';
import 'package:flutter_core/data/core_session.dart';
import 'package:example/core/config/config.dart';
import 'package:example/core/data/model/auth/auth.dart';

class ApiTokenInterceptor extends QueuedInterceptorsWrapper {
  final CoreSession _session = Get.find();

  static const _authTokenKey = 'AUTH_TOKEN';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final savedToken = await _savedToken;

    final headers = _initialHeaders;

    if (savedToken != null) {
      headers['Authorization'] = 'Bearer $savedToken';
    } else {
      try {
        final authResponse = await Dio(
          BaseOptions(
            baseUrl: Config.baseUrl,
            headers: { 'Authorization': 'Basic $_initialToken' }
          )
        ).post('/auth');
        final body = authResponse.data as Map<String, dynamic>;
        final auth = Auth.fromJson(body['data']);
        await _session.write(_authTokenKey, auth.accessToken);
        headers['Authorization'] = 'Bearer ${auth.accessToken}';
      } on DioException catch (e) {
        return handler.reject(e);
      } 
    }
    return handler.next(options.copyWith(headers: headers)); 
  }

  Map<String, String> get _initialHeaders => { 'platform': GetPlatform.isAndroid ? 'android' : 'ios' };

  Future<String?> get _savedToken async => await _session.read(_authTokenKey);

  String get _initialToken {
    String username = 'fluttercore';
    String password = 'fluttercore2024';
    String basicToken = base64.encode(utf8.encode('$username:$password'));
    return basicToken;
  }
}