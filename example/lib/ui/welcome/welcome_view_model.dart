import 'package:example/core/data/model/user/user.dart';
import 'package:flutter_core/base/viewmodel/core_view_model.dart';
import 'package:flutter_core/core.dart';
import 'package:flutter_core/data/collectable.dart';
import 'package:flutter_core/data/core_session.dart';
import 'package:flutter_core/utils/date_time_helper.dart';
import 'package:example/core/data/source/local/dao/user_dao.dart';
import 'package:example/ui/home/home_screen.dart';
import 'package:example/ui/login/login_screen.dart';

class WelcomeViewModel extends CoreViewModel {
  static const lastOpenKey = 'last_open_key';
  final UserDao _userDao = Get.find();
  final CoreSession _session = Get.find();

  final Collectable<String> lastOpen = Collectable('');

  _checkLogin() async {
    User? user = await _userDao.getLoginUser();

    if (user == null) {
      Get.offNamed(LoginScreen.routeName);
    } else {
      Get.offNamed(HomeScreen.routeName);
    }
  }

  _checkLastOpen() async {
    lastOpen.value = await _session.read(lastOpenKey) ?? '';
    await _session.write(lastOpenKey, DateTimeHelper().createdAt);
    Future.delayed(const Duration(seconds: 3), () => _checkLogin());
  }

  @override
  void onReady() {
    _checkLastOpen();
    super.onReady();
  }
}