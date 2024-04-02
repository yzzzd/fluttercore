import 'package:example/core/data/model/news/news.dart';
import 'package:example/core/data/model/user/user.dart';
import 'package:flutter_core/api/api_response.dart';
import 'package:flutter_core/core.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {

  factory ApiService(Dio dio) = _ApiService;

  @POST('/login')
  Future<ApiResponse<User>> login(
    @Field('username') String username, 
    @Field('password') String password 
  );

  @GET('/news')
  Future<ApiResponse<List<News>>> news();
}