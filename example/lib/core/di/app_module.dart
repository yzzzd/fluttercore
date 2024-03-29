import 'package:flutter_core/core.dart';
import 'package:flutter_core/data/core_session.dart';
import 'package:example/core/config/config.dart';
import 'package:example/core/data/source/api/api_service.dart';
import 'package:example/core/data/source/local/app_database.dart';
import 'package:example/core/utils/api_token_interceptor.dart';

class AppModule {
  static Future<void> initService() async {
    await Get.putAsync(() => AppDatabase.init());
    Get.lazyPut(() => Get.find<AppDatabase>().userDao);
    Get.lazyPut(() => CoreSession(), fenix: true);
    Get.lazyPut(() {
      final dio = Dio(
        BaseOptions(
          baseUrl: Config.baseUrl,
          sendTimeout: Config.networkTimeout,
          connectTimeout: Config.networkTimeout,
          receiveTimeout: Config.networkTimeout
        )
      );
      dio.interceptors.add(ApiTokenInterceptor());
      return dio;
    }, fenix: true);
    Get.lazyPut(() => ApiService(Get.find()), fenix: true);
  }
}