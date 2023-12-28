import 'dart:async';
import 'dart:math' hide log;

import 'package:fitness_app/src/animations/fade_in_dtt.dart';
import 'package:fitness_app/src/style/colors.dart';
import 'package:fitness_app/src/ui/group_exercise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/gradient_background_widget.dart';
import '../widgets/speed_slider_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool load = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 300)).then((value) {
        setState(() {
          load = !load;
        });
      });
    });
  }

  final ValueNotifier<int> _notifier = ValueNotifier<int>(0);
  final ValueNotifier<int> _rpmNotifier = ValueNotifier<int>(120);
  bool isActive = false;

  startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isActive) {
        _notifier.value = _notifier.value + 1;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  FadeInAnimationDTT(
                    delay: 1,
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text.rich(
                            TextSpan(
                              text: "4",
                              children: [
                                TextSpan(
                                  text: "/9",
                                  style: TextStyle(
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 4 / 9,
                              backgroundColor:
                                  AppColors.bgOrange.withOpacity(.2),
                              color: Colors.white,
                              minHeight: 15,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          const SizedBox(width: 20),
                          ValueListenableBuilder(
                            valueListenable: _notifier,
                            builder: (context, value, child) {
                              String s = Duration(seconds: value + 300)
                                  .toString()
                                  .split('.')[0];

                              s = "${s.split(':')[1]}:${s.split(':')[2]}";

                              return Text(
                                s,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  FadeInAnimationDTT(
                    delay: 1.5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        // color: Colors.deepOrange.shade400.withOpacity(.2),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              const Color.fromARGB(255, 95, 41, 2)
                                  .withOpacity(.3),
                              const Color.fromARGB(255, 111, 59, 7)
                                  .withOpacity(.3),
                            ]),
                      ),
                      child: Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "95",
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "cal",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  9,
                                  (index) => Align(
                                    alignment: Alignment.bottomCenter,
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      width: 15,
                                      height: load
                                          ? Random().nextInt(100) + 20
                                          : 10,
                                      decoration: BoxDecoration(
                                        color: index == 3
                                            ? Colors.white
                                            : Colors.orange.shade700,
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "238",
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "jumps",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInAnimationDTT(
                    delay: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const GroupExercise(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        height: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.lightOrange.withOpacity(.5),
                              AppColors.darkOrange.withOpacity(.5),
                            ],
                          ),
                        ),
                        child: ValueListenableBuilder(
                            valueListenable: _rpmNotifier,
                            builder: (context, value, child) {
                              return Column(
                                children: [
                                  Text(
                                    "$value",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 86,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    "rpm",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SpeedSlider(
                                    onChanged: (val) {
                                      _rpmNotifier.value = (val * 240).toInt();
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  ValueListenableBuilder(
                                    valueListenable: _rpmNotifier,
                                    builder: (context, value, child) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "too slow",
                                            style: TextStyle(
                                              color: value < 100
                                                  ? Colors.white
                                                  : Colors.white
                                                      .withOpacity(.6),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            "too fast",
                                            style: TextStyle(
                                              color: value <= 100
                                                  ? Colors.white.withOpacity(.6)
                                                  : Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                  ),
                  FadeInAnimationDTT(
                    delay: 2.5,
                    child: SizedBox(
                      height: 140,
                      child: Center(
                        child: ValueListenableBuilder(
                            valueListenable: _rpmNotifier,
                            builder: (context, value, child) {
                              return Text(
                                value == 100
                                    ? "Keep Going!"
                                    : value < 100
                                        ? "Go Faster!"
                                        : "Go Slower!",
                                style: const TextStyle(
                                  fontSize: 54,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                  FadeInAnimationDTT(
                    delay: 2.5,
                    child: StatefulBuilder(builder: (context, setS) {
                      return CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              isActive ? "Pause" : "Start",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (!isActive) {
                            startTimer();
                          }
                          setS(() {
                            isActive = !isActive;
                          });
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
