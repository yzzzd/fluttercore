import 'package:flutter_core/api/api_observer.dart';
import 'package:flutter_core/base/viewmodel/core_view_model.dart';
import 'package:flutter_core/core.dart';
import 'package:example/core/data/model/login/login_response.dart';
import 'package:example/core/data/source/api/api_service.dart';
import 'package:example/core/data/source/local/dao/user_dao.dart';
import 'package:example/ui/home/home_screen.dart';

class LoginViewModel extends CoreViewModel {
  
  final ApiService _apiService = Get.find();
  final UserDao _userDao = Get.find();

  login(String username, String password) {
    showDialog(message: 'Logging in...', loading: true);

    ApiObserver.run<LoginResponse>(
      api: () => _apiService.login(username, password),
      onSuccess: (response) async {
        await _userDao.saveLoginUser(response.user);
        dismissDialog();
        Get.offAllNamed(HomeScreen.routeName);
      },
      onError: (response) => showDialog(message: response.message)
    );
  }
}