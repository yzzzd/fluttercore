import 'package:dio/dio.dart';
import 'package:flutter_core/api/api_code.dart';
import 'package:flutter_core/api/api_response.dart';

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

  static run<T extends ApiResponse>({required Function() api, required Function(T response) onSuccess, required Function(ApiResponse response) onError}) async {
    try {
      final response = await api();
      response.code = ApiCode.success;
      onSuccess(response);
    } on DioException catch (e) {
      final ApiResponse response;
      if (e.response?.statusCode == ApiCode.error) {
        response = ApiResponse('${e.response?.data}');
      } else {
        response = ApiResponse.fromJson(e.response?.data);
      }
      response.code = e.response?.statusCode ?? ApiCode.error;
      onError(response);
    } catch (e) {
      final response = ApiResponse('$e');
      response.code = ApiCode.error;
      onError(response);
    }
  }
}