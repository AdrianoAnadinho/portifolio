import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portifolio/src/cubit/theme_cubit.dart';
import 'package:portifolio/src/cubit/theme_icon_cubit.dart';
import 'package:portifolio/src/pages/home_page.dart';

import 'package:portifolio/src/pages/intro_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeCubit cubit = ThemeCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => ThemeIconCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            // themeMode: ThemeMode.dark,
            theme: state,
            darkTheme: ThemeData.dark(),
            // home: MyHomePage(title: 'Flutter Demo Home Page'),
            home: IntroPage(),
          );
        },
      ),
    );
  }
}
