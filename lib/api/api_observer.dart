import 'package:dio/dio.dart';
import 'package:flutter_core/api/api_code.dart';
import 'package:flutter_core/api/api_response.dart';

class ApiObserver {

  static withCallback<T>({required Future<ApiResponse<T>> Function() api, required Function(ApiResponse<T> response) onSuccess, required Function(ApiResponse<T?> response) onError}) async {
    try {
      final response = await api()..code = ApiCode.success;
      onSuccess(response);
    } on DioException catch (e) {
      final ApiResponse<T?> response;
      if (e.response?.data == null) {
          response = ApiResponse(e.response?.statusMessage, null);
        } else {
          response = ApiResponse.fromJson(e.response?.data, (data) => null);
        }
      response.code = e.response?.statusCode ?? ApiCode.error;
      onError(response);
    } catch (e) {
      final response = ApiResponse(e.toString(), null)..code = ApiCode.error;
      onError(response);
    }
  }

  static Future<ApiResponse<T?>> withFuture<T>({required Future<ApiResponse<T>> Function() api}) async {
    try {
      return await api()..code = ApiCode.success;
    } on DioException catch (e) {
      final ApiResponse<T?> response;
      if (e.response?.data == null) {
        response = ApiResponse<T>(e.response?.statusMessage, null);
      } else {
        response = ApiResponse.fromJson(e.response?.data, (data) => null);
      }
      response.code = e.response?.statusCode ?? ApiCode.error;
      return response;
    } catch (e) {
      return ApiResponse<T>(e.toString(), null)..code = ApiCode.error;
    }
  }
}