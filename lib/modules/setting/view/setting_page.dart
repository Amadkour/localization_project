import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization_project/core/config.dart';
import 'package:localization_project/modules/setting/controller/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:  sl<SettingsCubit>(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Settings'),),
            body: Column(
              children: [
                TextButton(onPressed: () {
               context.read<SettingsCubit>().onChangeLang();
                }, child: Text(Config.localization['change_lang'])),

                TextButton(onPressed: () {
                  context.read<SettingsCubit>().changeMode();
                }, child: Text(Config.localization['chang_mode'])),
              ],
            ),
          );
        },
      ),
    );
  }
}
