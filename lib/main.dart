import 'package:flutter/material.dart';
import 'package:localization_project/core/base_page.dart';
import 'package:localization_project/core/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/config.dart' as di;
import 'modules/dashboard/view/dashboard_page.dart';
import 'modules/setting/controller/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Future<void> main() async {

  ///----------------check channel between project and native--------------///
  WidgetsFlutterBinding.ensureInitialized();

  di.initGitIt();
  SharedPreferences s =await SharedPreferences.getInstance();

  String lang=s.getString('lang')??'ar';



  ///--------------load language----------///
  await Config.loadLanguage(lang);

  ///--------------run app
  runApp(
      BlocProvider(
          create: (context) => sl<SettingsCubit>(),child:
          BasePage(
            w:    MaterialApp(
              themeMode:sl<SettingsCubit>().isDark==true?ThemeMode.dark:ThemeMode.light ,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.tealAccent,
              ),
              darkTheme: ThemeData(
                  scaffoldBackgroundColor: Colors.black
              ),
              debugShowCheckedModeBanner: false,
              home: DashboardPage(),
            ),
          )
    ));
}
