import 'package:aula_blocpattern/app/screens/home/home_widget.dart';
import 'package:aula_blocpattern/app/shared/themes/dark_theme.dart';
import 'package:aula_blocpattern/app/shared/themes/light_theme.dart';
import 'package:flutter/material.dart';

import 'app_bloc.dart';
import 'app_module.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<bool>(
      stream: AppModule.to.bloc<AppBloc>().theme,
      initialData: false,
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: snapshot.data ? darkTheme : lightTheme,
          home: HomeWidget(),
        );
      }
    );
  }
}
