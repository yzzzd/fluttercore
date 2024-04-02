import 'package:example/core/data/model/user/user.dart';
import 'package:flutter_core/api/api_observer.dart';
import 'package:flutter_core/base/viewmodel/core_view_model.dart';
import 'package:flutter_core/core.dart';
import 'package:example/core/data/source/api/api_service.dart';
import 'package:example/core/data/source/local/dao/user_dao.dart';
import 'package:example/ui/home/home_screen.dart';

class LoginViewModel extends CoreViewModel {
  
  final ApiService _apiService = Get.find();
  final UserDao _userDao = Get.find();

  login(String username, String password) async {
    showDialog(message: 'Logging in...', loading: true);

    /* ApiObserver.run<LoginResponse>(
      api: () => _apiService.login(username, password),
      onSuccess: (response) {
        _loginSuccess(response.user);
      },
      onError: (response) => showDialog(message: response.message)
    ); */

    /* final response = await ApiObserver.withFuture<LoginResponse>(api: () => _apiService.login(username, password), creator: () => LoginResponse('', null));

    if (response.isSuccessful) {
      _loginSuccess(response.user);
    } else {
      showDialog(message: response.message);
    } */

    /* ApiObserver.withDataCallback(
      api: () => _apiService.login(username, password),
      onSuccess: (response) {
        _loginSuccess(response.data);
      },
      onError: (response) => showDialog(message: response.message)
    ); */

    final response = await ApiObserver.withFuture(api: () => _apiService.login(username, password));
    if (response.isSuccessful) {
      _loginSuccess(response.data);
    } else {
      showDialog(message: response.message);
    }
  }

  _loginSuccess(User? user) async {
    if (user == null) return;
    await _userDao.saveLoginUser(user);
    dismissDialog();
    Get.offAllNamed(HomeScreen.routeName);
  }
}