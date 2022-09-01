import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization_project/core/base_page.dart';
import 'package:localization_project/core/config.dart';
import 'package:localization_project/modules/dashboard/controller/dashboard_cubit.dart';
import 'package:localization_project/modules/home/controller/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_project/modules/home/controller/home_states.dart';
import 'package:localization_project/modules/setting/controller/settings_cubit.dart';

import '../../profile/view/profile_page.dart';
import '../../setting/view/setting_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BasePage(w: BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          DashboardCubit c = context.read<DashboardCubit>();
          return Scaffold(
            appBar: AppBar(title: Text(Config.localization['title']),),
            body:PageView(
              controller:c.controllerPage ,
              children: [
                Center(child: Text('Home'),),
                ProfilePage(),
                SettingsPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                c.onChangePage(index);
              },
              items:  [
                BottomNavigationBarItem(icon: const Icon(CupertinoIcons.home),label: Config.localization['home']),
                BottomNavigationBarItem(icon: const Icon(CupertinoIcons.person),label: Config.localization['profile']),
                BottomNavigationBarItem(icon: const Icon(CupertinoIcons.settings_solid),label: Config.localization['setting'])
              ],
            ),
          );
        },
      ),
    ));


  }
}
