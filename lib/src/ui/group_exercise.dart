import 'package:fitness_app/src/ui/profile.dart';
import 'package:fitness_app/src/widgets/gradient_background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../style/colors.dart';

class GroupExercise extends StatefulWidget {
  const GroupExercise({super.key});

  @override
  State<GroupExercise> createState() => _GroupExerciseState();
}

class _GroupExerciseState extends State<GroupExercise> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.deepOrange.shade400.withOpacity(.2),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color.fromARGB(255, 143, 82, 35).withOpacity(.4),
                        const Color.fromARGB(255, 206, 134, 63).withOpacity(.4),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '08:45',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: .6,
                        backgroundColor: AppColors.bgOrange.withOpacity(.2),
                        color: Colors.white,
                        minHeight: 15,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.lightOrange.withOpacity(.7),
                        AppColors.darkOrange.withOpacity(.7),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Iconsax.timer,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Jump !",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 54,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Row(
                    children: List.generate(
                      3,
                      (index) {
                        List<double> h = [243, 121, 178];
                        List<int> v = [73, 34, 53];
                        List<String> names = [
                          "Negar S.",
                          "Joanna L.",
                          "Angela"
                        ];
                        return Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProfilePage(
                                        index: index,
                                        name: names[index],
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  height: 60,
                                  child: Hero(
                                    tag: Key("img_$index"),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(1002),
                                      child: Image.network(
                                          'https://randomuser.me/api/portraits/women/$index.jpg'),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                names[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: index == 0
                                      ? Colors.white
                                      : Colors.orange.shade400.withOpacity(.6),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.only(bottom: 20),
                                height: load ? h[index] : 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: index == 0
                                        ? [
                                            AppColors.lightOrange,
                                            AppColors.darkOrange,
                                          ]
                                        : [
                                            const Color.fromARGB(
                                                    255, 206, 134, 63)
                                                .withOpacity(.4),
                                            const Color.fromARGB(
                                                    255, 143, 82, 35)
                                                .withOpacity(.4),
                                          ],
                                  ),
                                ),
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 400),
                                  opacity: load ? 1 : 0,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text.rich(
                                      TextSpan(
                                        text: "${v[index]}",
                                        children: const [
                                          TextSpan(
                                            text: "\njumps",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        "Pause",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
