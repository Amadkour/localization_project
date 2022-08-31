

import 'package:flutter/cupertino.dart';
import 'package:localization_project/core/config.dart';
import 'package:localization_project/modules/home/controller/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(LoadedState());



  onChangeLang() async {


    SharedPreferences s =await SharedPreferences.getInstance();

    String lang=s.getString('lang')??'ar';

    if(lang=='ar'){
      s.setString('lang', 'en');
      Config.loadLanguage('en');
    }else{
      s.setString('lang', 'ar');
      Config.loadLanguage('ar');
    }

    emit(LanguageState());

  }

  PageController controllerPage=PageController();
  
  onChangePage(index){
    controllerPage.jumpToPage(index);
    emit(LoadedState());

  }

}