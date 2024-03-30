import 'package:dio/dio.dart';
import 'package:flutter_core/api/api_code.dart';
import 'package:flutter_core/api/api_response.dart';

class ApiObserver {

  static withCallback({required Function() api, required Function(ApiResponse response) onSuccess, required Function(ApiResponse response) onError}) async {
    try {
      final response = await api();
      response.code = ApiCode.success;
      onSuccess(response);
    } on DioException catch (e) {
      final ApiResponse response;
      if (e.response?.data == null) {
          response = ApiResponse('null', null);
        } else {
          response = ApiResponse.fromJson(e.response?.data, (data) => null);
        }
      response.code = e.response?.statusCode ?? ApiCode.error;
      onError(response);
    } catch (e) {
      final response = ApiResponse('$e', null);
      response.code = ApiCode.error;
      onError(response);
    }
  }

  static Future<ApiResponse> withFuture({required Function() api}) async {
    try {
      final response = await api();
      response.code = ApiCode.success;
      return response;
    } on DioException catch (e) {
      final ApiResponse response;
      if (e.response?.data == null) {
          response = ApiResponse('null', null);
        } else {
          response = ApiResponse.fromJson(e.response?.data, (data) => null);
        }
      response.code = e.response?.statusCode ?? ApiCode.error;
      return response;
    } catch (e) {
      final response = ApiResponse('$e', null);
      response.code = ApiCode.error;
      return response;
    }
  }
}