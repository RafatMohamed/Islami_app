abstract class SharedPref {
  Future<void> initSharedMain();
  Future<void> saveObj(dynamic obj);
  dynamic getObj();
  Future<void> clearObj();
}
