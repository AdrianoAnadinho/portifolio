import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/src/cubit/tab_bar_visibility_cubit.dart';
import 'package:portifolio/src/cubit/text_animation_cubit.dart';
import 'package:portifolio/src/pages/home_page.dart';

import '../cubit/theme_cubit.dart';
import '../cubit/theme_icon_cubit.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  // TODO: instead of instantiating every cubit, make a cubit that manages a list of them
  TextAnimationCubit homeTextCubit = TextAnimationCubit();
  TextAnimationCubit aboutTextCubit = TextAnimationCubit();
  TextAnimationCubit resumeTextCubit = TextAnimationCubit();
  TextAnimationCubit servicesTextCubit = TextAnimationCubit();
  TextAnimationCubit portfolioTextCubit = TextAnimationCubit();
  TextAnimationCubit contactTextCubit = TextAnimationCubit();

  TabBarVisibilityCubit tabBarVisibilityCubit = TabBarVisibilityCubit();

  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 7, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    var themeCubit = context.read<ThemeCubit>();
    var iconCubit = context.read<ThemeIconCubit>();

    return BlocBuilder<ThemeIconCubit, ThemeIconState>(
      bloc: iconCubit,
      builder: (context, iconState) {
        return BlocBuilder<ThemeCubit, ThemeData>(
          bloc: themeCubit,
          builder: (context, themeState) {
            return BlocBuilder<TabBarVisibilityCubit, bool>(
              bloc: tabBarVisibilityCubit,
              builder: (context, tabState) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: iconState is ThemeIconDark
                          ? ColorFilter.mode(
                              Color.fromRGBO(156, 109, 7, 1).withOpacity(0.3),
                              BlendMode.darken)
                          : ColorFilter.mode(Colors.lightBlue, BlendMode.color),
                      fit: BoxFit.cover,
                      image: iconState is ThemeIconDark
                          ? AssetImage('assets/images/branco.jpg')
                          : AssetImage('assets/images/3211663.jpg'),
                    ),
                  ),
                  child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: TabBar(
                        controller: tabController,
                        tabs: [],
                      ).preferredSize,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: TabBar(
                              isScrollable: false,
                              indicator:
                                  BoxDecoration(color: Colors.transparent),
                              indicatorColor: Colors.transparent,
                              labelColor: Colors.transparent,
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  return Colors.transparent;
                                },
                              ),
                              tabs: [
                                Visibility(
                                  visible: tabState,
                                  child: GestureDetector(
                                    onTap: () {
                                      tabController.animateTo(0);
                                      print('entrou ontap');
                                      if (tabState) {
                                        print('entrou esconder');
                                        tabBarVisibilityCubit
                                            .changeVisibility();
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 24),
                                      child: UnderlineAnimation(
                                        textCubit: homeTextCubit,
                                        text: 'Home',
                                        color: Colors.red,
                                        duration: Duration(milliseconds: 200),
                                        maxWidth: 30,
                                        minWidth: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: tabState,
                                  child: GestureDetector(
                                    onTap: () => tabController.animateTo(1),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 24),
                                      child: UnderlineAnimation(
                                        textCubit: aboutTextCubit,
                                        text: 'About',
                                        color: Colors.red,
                                        duration: Duration(milliseconds: 200),
                                        maxWidth: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: tabState,
                                  child: GestureDetector(
                                    onTap: () => tabController.animateTo(2),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 24),
                                      child: UnderlineAnimation(
                                        textCubit: resumeTextCubit,
                                        text: 'Resume',
                                        color: Colors.red,
                                        duration: Duration(milliseconds: 200),
                                        maxWidth: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: tabState,
                                  child: GestureDetector(
                                    onTap: () => tabController.animateTo(3),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 24),
                                      child: UnderlineAnimation(
                                        textCubit: servicesTextCubit,
                                        text: 'Services',
                                        color: Colors.red,
                                        duration: Duration(milliseconds: 200),
                                        maxWidth: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: tabState,
                                  child: GestureDetector(
                                    onTap: () => tabController.animateTo(4),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 24),
                                      child: UnderlineAnimation(
                                        textCubit: portfolioTextCubit,
                                        text: 'Portfolio',
                                        color: Colors.red,
                                        duration: Duration(milliseconds: 200),
                                        maxWidth: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: tabState,
                                  child: GestureDetector(
                                    onTap: () => tabController.animateTo(5),
                                    child: UnderlineAnimation(
                                      textCubit: contactTextCubit,
                                      text: 'Contact',
                                      color: Colors.red,
                                      duration: Duration(milliseconds: 200),
                                      maxWidth: 30,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  alignment: Alignment.centerLeft,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    print(tabController.index);
                                    themeCubit.changeMode();
                                    iconCubit.changeIcon();
                                  },
                                  icon: iconState is ThemeIconDark
                                      ? Icon(
                                          Icons.dark_mode,
                                          color: Colors.black,
                                        )
                                      : Icon(
                                          Icons.light_mode,
                                          color: Colors.white,
                                        ),
                                ),
                              ],
                              controller: tabController,
                            ),
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
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width / 10),
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  HomePageWidget(
                                    tabState: tabState,
                                    visibilityCubit: tabBarVisibilityCubit,
                                    tabController: tabController,
                                    homeTextCubit: homeTextCubit,
                                    aboutTextCubit: aboutTextCubit,
                                    resumeTextCubit: resumeTextCubit,
                                    servicesTextCubit: servicesTextCubit,
                                    portfolioTextCubit: portfolioTextCubit,
                                    contactTextCubit: contactTextCubit,
                                  ),
                                  Container(
                                    color: Colors.black.withOpacity(0.3),
                                    child: Padding(
                                      padding: const EdgeInsets.all(24),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Text('ABOUT'),
                                              ),
                                              Container(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .color,
                                                height: 2,
                                                width: 150,
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'LEARN MORE ABOUT ME',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: Theme.of(context)
                                                        .textTheme
                                                        .headline4!
                                                        .fontSize,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 36),
                                                    child: Container(
                                                      height: 300,
                                                      width: 300,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          colorFilter:
                                                              ColorFilter.mode(
                                                                  Colors.black
                                                                      .withOpacity(
                                                                          0.3),
                                                                  BlendMode
                                                                      .color),
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                              'assets/images/eu.png'),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 8),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Software Developer & Tech Passionate',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline5!
                                                                      .fontSize,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 8),
                                                        child: Row(
                                                          children: const [
                                                            Expanded(
                                                              child: Text(
                                                                  "As of 2020, I got to enter the software development field, through my university, and fell in love with everything about it. Now I want to improve myself to create smarter and better solutions."),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ArrowTextWidget(
                                                                  text1:
                                                                      'Birthday: ',
                                                                  text2:
                                                                      '9 September 1994'),
                                                              ArrowTextWidget(
                                                                  text1:
                                                                      'Linkedin Profile: ',
                                                                  text2: ''),
                                                              ArrowTextWidget(
                                                                  text1:
                                                                      'Phone: ',
                                                                  text2:
                                                                      '(62) 9 8234 1774'),
                                                              ArrowTextWidget(
                                                                  text1:
                                                                      'City: ',
                                                                  text2:
                                                                      'Goiânia, Brazil'),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 32),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ArrowTextWidget(
                                                                    text1:
                                                                        'Age: ',
                                                                    text2:
                                                                        '28'),
                                                                ArrowTextWidget(
                                                                    text1:
                                                                        'Degree: ',
                                                                    text2:
                                                                        'Incomplete Graduation'),
                                                                ArrowTextWidget(
                                                                    text1:
                                                                        'Email: ',
                                                                    text2:
                                                                        'adrianoanadinho@gmail.com'),
                                                                ArrowTextWidget(
                                                                    text1:
                                                                        'Freelance: ',
                                                                    text2:
                                                                        'Unavailable'),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Center(child: Text('Resume page')),
                                  ),
                                  Container(
                                    child: Center(child: Text('Services page')),
                                  ),
                                  Container(
                                    child:
                                        Center(child: Text('Portfolio page')),
                                  ),
                                  Container(
                                    child: Center(child: Text('Contact page')),
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class ArrowTextWidget extends StatelessWidget {
  const ArrowTextWidget({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
      child: Row(
        children: [
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.green,
          ),
          Text(
            text1,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(text2)
        ],
      ),
    );
  }
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({
    Key? key,
    required this.homeTextCubit,
    required this.aboutTextCubit,
    required this.resumeTextCubit,
    required this.servicesTextCubit,
    required this.portfolioTextCubit,
    required this.contactTextCubit,
    required this.tabController,
    required this.visibilityCubit,
    required this.tabState,
  }) : super(key: key);

  final TextAnimationCubit homeTextCubit;
  final TextAnimationCubit aboutTextCubit;
  final TextAnimationCubit resumeTextCubit;
  final TextAnimationCubit servicesTextCubit;
  final TextAnimationCubit portfolioTextCubit;
  final TextAnimationCubit contactTextCubit;
  final TabController tabController;
  final TabBarVisibilityCubit visibilityCubit;
  final bool tabState;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                      fontSize:
                          Theme.of(context).textTheme.headline2?.fontSize),
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
                  style: Theme.of(context).textTheme.headline4,
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
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: UnderlineAnimation(
                          textCubit: homeTextCubit,
                          text: 'Home',
                          color: Colors.red,
                          duration: Duration(milliseconds: 200),
                          maxWidth: 30,
                          minWidth: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        tabController.animateTo(1),
                        if (tabController.index != 0 && !tabState)
                          {
                            visibilityCubit.changeVisibility(),
                          }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: UnderlineAnimation(
                          textCubit: aboutTextCubit,
                          text: 'About',
                          color: Colors.red,
                          duration: Duration(milliseconds: 200),
                          maxWidth: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        tabController.animateTo(2),
                        if (tabController.index != 0 && !tabState)
                          {
                            visibilityCubit.changeVisibility(),
                          }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: UnderlineAnimation(
                          textCubit: resumeTextCubit,
                          text: 'Resume',
                          color: Colors.red,
                          duration: Duration(milliseconds: 200),
                          maxWidth: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        tabController.animateTo(3),
                        if (tabController.index != 0 && !tabState)
                          {
                            visibilityCubit.changeVisibility(),
                          }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: UnderlineAnimation(
                          textCubit: servicesTextCubit,
                          text: 'Services',
                          color: Colors.red,
                          duration: Duration(milliseconds: 200),
                          maxWidth: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        tabController.animateTo(4),
                        if (tabController.index != 0 && !tabState)
                          {
                            visibilityCubit.changeVisibility(),
                          }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: UnderlineAnimation(
                          textCubit: portfolioTextCubit,
                          text: 'Portfolio',
                          color: Colors.red,
                          duration: Duration(milliseconds: 200),
                          maxWidth: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        tabController.animateTo(5),
                        if (tabController.index != 0 && !tabState)
                          {
                            visibilityCubit.changeVisibility(),
                          }
                      },
                      child: UnderlineAnimation(
                        textCubit: contactTextCubit,
                        text: 'Contact',
                        color: Colors.red,
                        duration: Duration(milliseconds: 200),
                        maxWidth: 30,
                      ),
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
                child: Icon(FontAwesomeIcons.linkedin),
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
                      : Theme.of(context).textTheme.headlineMedium!.color,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
