import 'package:floor/floor.dart';
import 'package:example/core/data/model/user/user.dart';

@dao
abstract class UserDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> saveLoginUser(User user);

  @Query('SELECT * FROM User WHERE idb = 1')
  Future<User?> getLoginUser();

  @Query('DELETE FROM User WHERE idb = 1')
  Future<void> deleteLoginUser();
}