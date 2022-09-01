import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'package:localization_project/modules/setting/controller/settings_cubit.dart';

abstract class Config {
  static Map localization = {};

  static loadLanguage(String lang) async {
    String translation;
    if (lang == 'ar') {
      translation = await rootBundle.loadString('assets/localization/ar.json');
    } else {
      translation = await rootBundle.loadString('assets/localization/en.json');
    }
    localization = jsonDecode(translation);
  }
}
  final sl = GetIt.instance;
  initGitIt(){
    sl.registerSingleton(SettingsCubit());
  }




