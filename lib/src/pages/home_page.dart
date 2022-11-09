import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portifolio/src/cubit/theme_icon_cubit.dart';

import '../cubit/theme_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeCubit = context.read<ThemeCubit>();
    var iconCubit = context.read<ThemeIconCubit>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Switch(
          //     value: false,
          //     onChanged: (value) {
          //       cubit.changeMode(value);
          //     }),
          BlocBuilder<ThemeIconCubit, ThemeIconState>(
            bloc: iconCubit,
            builder: (context2, iconState) {
              return BlocBuilder<ThemeCubit, ThemeData>(
                bloc: themeCubit,
                builder: (context, themeState) {
                  return IconButton(
                      onPressed: () {
                        themeCubit.changeMode();
                        iconCubit.changeIcon();
                      },
                      icon: iconState is ThemeIconDark
                          ? Icon(Icons.dark_mode)
                          : Icon(Icons.light_mode));
                },
              );
            },
          )
        ],
      ),
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NewWidget extends StatelessWidget implements PreferredSizeWidget {
  const NewWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
        color: Colors.red,
        child: Text('oi'),
      ),
      preferredSize: size,
    );
  }

  @override
  Size get preferredSize => size;
}
