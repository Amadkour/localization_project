import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  PageController controllerPage=PageController();

  onChangePage(index){
    controllerPage.jumpToPage(index);
    emit(DashboardInitial());

  }

}
