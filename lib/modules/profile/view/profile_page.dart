import 'package:flutter/cupertino.dart';
import 'package:localization_project/core/base_page.dart';
import 'package:localization_project/core/config.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(w: Container(
      child: Text(Config.localization['profile']),
    ));
  }
}
