import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/src/cubit/text_animation_cubit.dart';
import 'package:portifolio/src/pages/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  TextAnimationCubit homeTextCubit = TextAnimationCubit();
  TextAnimationCubit aboutTextCubit = TextAnimationCubit();
  TextAnimationCubit resumeTextCubit = TextAnimationCubit();
  TextAnimationCubit servicesTextCubit = TextAnimationCubit();
  TextAnimationCubit portfolioTextCubit = TextAnimationCubit();
  TextAnimationCubit contactTextCubit = TextAnimationCubit();

  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 1, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/3211663.jpg'),
        ),
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: TabBar(
            tabs: [],
          ).preferredSize,
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 100,
              child: TabBar(
                indicator: BoxDecoration(color: Colors.transparent),
                indicatorColor: Colors.transparent,
                labelColor: Colors.transparent,
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  return Colors.transparent;
                }),
                tabs: [
                  GestureDetector(
                    onTap: () => print('go home man'),
                    child: UnderlineAnimation(
                      textCubit: homeTextCubit,
                      text: 'Home',
                      color: Colors.red,
                      duration: Duration(milliseconds: 200),
                      maxWidth: 30,
                      minWidth: 30,
                    ),
                  ),
                ],
                controller: tabController,
              ),
            ),
          ),
        ),
        // AppBar(
        //   actions: [Icon(Icons.lock_clock)],
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ) ,
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: SizedBox(
                height: max(constraints.maxHeight, 200),
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width / 10),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Adriano Anadinho',
                                    style: TextStyle(
                                        overflow: TextOverflow.fade,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .headline2
                                            ?.fontSize),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Brazillian developer ',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 24),
                                        child: GestureDetector(
                                          onTap: () => print('go home man'),
                                          child: UnderlineAnimation(
                                            textCubit: homeTextCubit,
                                            text: 'Home',
                                            color: Colors.red,
                                            duration:
                                                Duration(milliseconds: 200),
                                            maxWidth: 30,
                                            minWidth: 30,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 24),
                                        child: GestureDetector(
                                          onTap: () => {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyHomePage(title: 'app'),
                                                ))
                                          },
                                          child: UnderlineAnimation(
                                            textCubit: aboutTextCubit,
                                            text: 'About',
                                            color: Colors.red,
                                            duration:
                                                Duration(milliseconds: 200),
                                            maxWidth: 30,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 24),
                                        child: UnderlineAnimation(
                                          textCubit: resumeTextCubit,
                                          text: 'Resume',
                                          color: Colors.red,
                                          duration: Duration(milliseconds: 200),
                                          maxWidth: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 24),
                                        child: UnderlineAnimation(
                                          textCubit: servicesTextCubit,
                                          text: 'Services',
                                          color: Colors.red,
                                          duration: Duration(milliseconds: 200),
                                          maxWidth: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 24),
                                        child: UnderlineAnimation(
                                          textCubit: portfolioTextCubit,
                                          text: 'Portfolio',
                                          color: Colors.red,
                                          duration: Duration(milliseconds: 200),
                                          maxWidth: 30,
                                        ),
                                      ),
                                      UnderlineAnimation(
                                        textCubit: contactTextCubit,
                                        text: 'Contact',
                                        color: Colors.red,
                                        duration: Duration(milliseconds: 200),
                                        maxWidth: 30,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  alignment: Alignment.centerLeft,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: Icon(
                                    FontAwesomeIcons.discord,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(FontAwesomeIcons.reddit),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(FontAwesomeIcons.whatsapp),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(FontAwesomeIcons.github),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class UnderlineAnimation extends StatelessWidget {
  const UnderlineAnimation({
    Key? key,
    required this.textCubit,
    required this.text,
    required this.duration,
    required this.maxWidth,
    this.minWidth,
    required this.color,
  }) : super(key: key);

  final TextAnimationCubit textCubit;
  final String text;
  final Duration duration;
  final double maxWidth;
  final double? minWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) => textCubit.deactivateAnimation(),
      onHover: (event) => textCubit.activateAnimation(),
      child: BlocBuilder<TextAnimationCubit, bool>(
        bloc: textCubit,
        builder: (context, state) {
          return Stack(
            children: [
              AnimatedContainer(
                width: state ? maxWidth : (minWidth ?? 0),
                duration: duration,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: color, width: 2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(''),
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: state
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
