import 'package:flutter/material.dart';
import 'package:islami_app/app/islami_app.dart';
import 'package:islami_app/core/shared/shared_pref_hive.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefHiveImp.instance.initSharedMain();
  runApp(const IslamiApp());
}
