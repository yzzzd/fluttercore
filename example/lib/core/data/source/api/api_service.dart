import 'package:flutter_core/core.dart';
import 'package:example/core/data/model/login/login_response.dart';
import 'package:example/core/data/model/news/news_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {

  factory ApiService(Dio dio) = _ApiService;

  @POST('/login')
  Future<LoginResponse> login(
    @Field('username') String username, 
    @Field('password') String password 
  );

  @GET('/news')
  Future<NewsResponse> news();
}