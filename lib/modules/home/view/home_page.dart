import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization_project/core/config.dart';
import 'package:localization_project/modules/home/controller/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_project/modules/home/controller/home_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit c = context.read<HomeCubit>();
          return Scaffold(
            appBar: AppBar(title: Text(Config.localization['title']),),
            body:PageView(
              controller:c.controllerPage ,
              children: [

                Center(
                  child: TextButton(onPressed: () {

                    context.read<HomeCubit>().onChangeLang();
                  },
                    child: Text(Config.localization['change_lang']),

                  ),
                ),
                Center(child: Text('NOTIFICATIONS'),),
                Center(child: Text('PROFILE'),),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                c.onChangePage(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
                BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'notification'),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile')
              ],
            ),
          );
        },
      ),
    );
  }
}
