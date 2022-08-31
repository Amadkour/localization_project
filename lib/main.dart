import 'package:flutter/material.dart';
import 'package:localization_project/core/config.dart';
import 'package:localization_project/modules/home/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> main() async {

  ///----------------check channel between project and native--------------///
  WidgetsFlutterBinding.ensureInitialized();


  SharedPreferences s =await SharedPreferences.getInstance();

  String lang=s.getString('lang')??'ar';



  ///--------------load language----------///
  await Config.loadLanguage(lang);

  ///--------------run app
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
