import 'package:dio/dio.dart';
import 'package:flutter_core/api/api_code.dart';
import 'package:flutter_core/api/api_data_response.dart';
import 'package:flutter_core/api/api_response.dart';
import 'package:flutter_core/api/core_api_response.dart';

class ApiObserver {
  static run<T extends CoreApiResponse>({required Function() api, required Function(T response) onSuccess, required Function(ApiResponse response) onError}) async {
    try {
      final response = await api();
      response.code = ApiCode.success;
      onSuccess(response);
    } on DioException catch (e) {
      final response = ApiResponse('');
      if (e.response?.data == null) {
        response.message = '${e.message}';
      } else {
        response.message = '${e.response?.data['message']}';
      }
      response.code = e.response?.statusCode ?? ApiCode.error;
      onError(response);
    } catch (e) {
      final response = ApiResponse('$e');
      response.code = ApiCode.error;
      onError(response);
    }
  }

  static Future<T> runInline<T extends ApiResponse>({required Function() api, required T Function() creator}) async {
    try {
      final response = await api();
      response.code = ApiCode.success;
      return response;
    } on DioException catch (e) {
      final response = creator();
      if (e.response?.data == null) {
        response.message = '${e.message}';
      } else {
        response.message = '${e.response?.data['message']}';
      }
      response.code = e.response?.statusCode ?? ApiCode.error;
      return response;
    } catch (e) {
      final response = creator();
      response.code = ApiCode.error;
      response.message = '$e';
      return response;
    }
  }

  static runWithData({required Function() api, required Function(ApiDataResponse response) onSuccess, required Function(ApiDataResponse response) onError}) async {
    try {
      final response = await api();
      response.code = ApiCode.success;
      onSuccess(response);
    } on DioException catch (e) {
      final ApiDataResponse response;
      if (e.response?.data == null) {
          response = ApiDataResponse('null', null);
        } else {
          response = ApiDataResponse.fromJson(e.response?.data, (data) => null);
        }
      response.code = e.response?.statusCode ?? ApiCode.error;
      onError(response);
    } catch (e) {
      final response = ApiDataResponse('$e', null);
      response.code = ApiCode.error;
      onError(response);
    }
  }

  static Future<ApiDataResponse> runInlineData({required Function() api}) async {
    try {
      final response = await api();
      response.code = ApiCode.success;
      return response;
    } on DioException catch (e) {
      final ApiDataResponse response;
      if (e.response?.data == null) {
          response = ApiDataResponse('null', null);
        } else {
          response = ApiDataResponse.fromJson(e.response?.data, (data) => null);
        }
      response.code = e.response?.statusCode ?? ApiCode.error;
      return response;
    } catch (e) {
      final response = ApiDataResponse('$e', null);
      response.code = ApiCode.error;
      return response;
    }
  }
}