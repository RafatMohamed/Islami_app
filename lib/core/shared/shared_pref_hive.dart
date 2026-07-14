import 'package:hive_flutter/hive_flutter.dart';
import 'package:islami_app/core/shared/shared_pref.dart';
import '../const.dart';

class SharedPrefHiveImp implements SharedPref {
  SharedPrefHiveImp._internal();
  static final SharedPrefHiveImp instance = SharedPrefHiveImp._internal();
  factory SharedPrefHiveImp() {
    return instance;
  }
  static final Box<bool> box = Hive.box<bool>(AppConst.nameBoxISFirestOpining);

  @override
  Future<void> initSharedMain() async {
    await Hive.initFlutter();
    await Hive.openBox<bool>(AppConst.nameBoxISFirestOpining);
    await Hive.openBox<List<int>>(AppConst.nameBoxSuraResentView);
  }

  @override
  Future<void> saveObj(isOpen) async {
    await box.put(AppConst.keyBoxIsFirestLogin, isOpen);
  }

  @override
  bool getObj() {
    final result = box.get(AppConst.keyBoxIsFirestLogin);
    return result ?? false;
  }

  @override
  Future<void> clearObj(){
   return box.clear();
  }
}
