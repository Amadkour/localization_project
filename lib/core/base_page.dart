import 'package:flutter/cupertino.dart';
import 'package:localization_project/modules/setting/controller/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BasePage extends StatelessWidget {
  const BasePage({Key? key, required this.w}) : super(key: key);
  final Widget w;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return w;
      },
    );
  }
}
