import 'package:dio/dio.dart';
import 'package:flutter_core/api/api_code.dart';
import 'package:flutter_core/api/api_data_response.dart';
import 'package:flutter_core/api/api_response.dart';
import 'package:flutter_core/api/core_api_response.dart';

class ApiObserver {
  /* static Future<T> run1<T extends ApiResponse>(Function() api) async {
    var response;
    try {
      response = await api();
    } on DioException catch (e) {
      //response = ApiResponse.fromJson(e.response?.data);
    } catch (e) {
      response = ApiResponse(500, '$e');
    }
    return response;
  } */

  static run<T extends CoreApiResponse>({required Function() api, required Function(T response) onSuccess, required Function(ApiResponse response) onError}) async {
    try {
      final response = await api();
      response.code = ApiCode.success;
      onSuccess(response);
    } on DioException catch (e) {
      final ApiResponse response;
      if (e.response?.statusCode == ApiCode.error) {
        response = ApiResponse('${e.response?.data}');
      } else {
        if (e.response?.data == null) {
          response = ApiResponse('${e.response?.data}');
        } else {
          response = ApiResponse.fromJson(e.response?.data);
        }
      }
      response.code = e.response?.statusCode ?? ApiCode.error;
      onError(response);
    } catch (e) {
      final response = ApiResponse('$e');
      response.code = ApiCode.error;
      onError(response);
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