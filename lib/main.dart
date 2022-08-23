import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:question_master/core/utils/get_it.dart';
import 'package:question_master/ui/screens/main_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  await EasyLocalization.ensureInitialized();
  setupGetIt();

  runApp(const MainApp());
}
