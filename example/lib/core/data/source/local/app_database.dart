import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:example/core/data/model/user/user.dart';
import 'package:example/core/data/source/local/dao/user_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;

  static Future<AppDatabase> init() async {
    AppDatabase instance = await $FloorAppDatabase.databaseBuilder('sample_core.db').build();
    return instance;
  }
}