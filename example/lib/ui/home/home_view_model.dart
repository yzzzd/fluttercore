import 'package:flutter_core/api/api_observer.dart';
import 'package:flutter_core/base/viewmodel/core_view_model.dart';
import 'package:flutter_core/core.dart';
import 'package:flutter_core/data/collectable.dart';
import 'package:flutter_core/data/core_session.dart';
import 'package:example/core/data/model/news/news.dart';
import 'package:example/core/data/model/user/user.dart';
import 'package:example/core/data/source/api/api_service.dart';
import 'package:example/core/data/source/local/dao/user_dao.dart';
import 'package:example/ui/login/login_screen.dart';

class HomeViewModel extends CoreViewModel {

  final ApiService _apiService = Get.find();
  final UserDao _userDao = Get.find();
  final CoreSession _session = Get.find();

  final Collectable<User?> user = Collectable(null);
  final Collectable<List<News>> news = Collectable(List.empty());
  final Collectable<bool> newsLoading = Collectable(false);

  _checkLogin() async {
    user.value = await _userDao.getLoginUser();
  }

  logout() async {
    await _userDao.deleteLoginUser();
    await _session.clear();
    Get.offAllNamed(LoginScreen.routeName);
  }

  _getNews() {
    newsLoading.value = true;

    ApiObserver.withCallback(
      api: () => _apiService.news(), 
      onSuccess: (response) {
        newsLoading.value = false;
        news.value = response.data!;
      }, 
      onError: (response) {
        newsLoading.value = false;
      }
    );
  }

  @override
  void onInit() {
    _checkLogin();
    _getNews();
    super.onInit();
  }
}