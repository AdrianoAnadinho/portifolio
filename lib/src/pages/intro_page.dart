import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/src/cubit/text_animation_cubit.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  TextAnimationCubit textCubit = TextAnimationCubit();
  late AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: SizedBox(
            height: max(constraints.maxHeight, 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Adriano Anadinho',
                      style: Theme.of(context).textTheme.headline3,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Brazillian developer ',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {},
                      child: Container(
                        child: Text(
                          'Home',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        decoration: BoxDecoration(),
                      ),
                    ),
                    MouseRegion(
                      onExit: (event) => textCubit.deactivateAnimation(),
                      // cursor: MouseCursor.uncontrolled,
                      onHover: (event) => textCubit.activateAnimation(),
                      child: BlocBuilder<TextAnimationCubit, bool>(
                        bloc: textCubit,
                        builder: (context, state) {
                          return Text(
                            'About',
                            style: TextStyle(
                              color: state
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context).colorScheme.primary,
                            ),
                          );
                          // AnimatedTextKit(
                          //     totalRepeatCount: 1,
                          //     // isRepeatingAnimation: state,
                          //     repeatForever: state,
                          //     pause: Duration.zero,
                          //     onTap: () => print(state),
                          //     animatedTexts: [
                          //       ColorizeAnimatedText(
                          //         speed: Duration(milliseconds: 500),
                          //         'About',
                          //         textStyle: TextStyle(fontSize: 16),
                          //         colors: [
                          //           Colors.white,
                          //           Colors.red,
                          //           Colors.purple,
                          //           Colors.blue
                          //         ],
                          //       )
                          //     ]);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Resume'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Services'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Portifolio'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Contact'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(FontAwesomeIcons.discord),
                    Icon(FontAwesomeIcons.reddit),
                    Icon(FontAwesomeIcons.whatsapp),
                    Icon(FontAwesomeIcons.github)
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    // TODO: implement createTicker
    throw UnimplementedError();
  }
}
