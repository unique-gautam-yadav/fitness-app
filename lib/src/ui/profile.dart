// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fitness_app/src/widgets/gradient_background_widget.dart';
import 'package:fitness_app/src/widgets/graph_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../style/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    required this.index,
    required this.name,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();

  final int index;
  final String name;
}

class _ProfilePageState extends State<ProfilePage> {
  String selected = "Cardio";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Iconsax.back_square,
                        color: Colors.orange.withOpacity(.8),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {},
                      child: Icon(
                        Iconsax.forward_square,
                        color: Colors.orange.withOpacity(.8),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 140,
                  child: Hero(
                    tag: Key("img_${widget.index}"),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1002),
                      child: Image.network(
                        'https://randomuser.me/api/portraits/women/${widget.index}.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange.shade400,
                    ),
                    borderRadius: BorderRadius.circular(122),
                  ),
                  child: const Text(
                    "Friend",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      child: Row(
                        children: [
                          Icon(
                            Iconsax.clock,
                            color: Colors.orange.shade300,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Cardio",
                            style: TextStyle(
                              color: selected != "Cardio"
                                  ? Colors.white
                                  : Colors.orange.shade300,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          selected = "Cardio";
                        });
                      },
                    ),
                    CupertinoButton(
                      child: Row(
                        children: [
                          Icon(
                            Iconsax.status_up,
                            color: Colors.orange.shade300,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Strength",
                            style: TextStyle(
                              color: selected != "Strength"
                                  ? Colors.white
                                  : Colors.orange.shade300,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          selected = "Strength";
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  height: 250,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.lightOrange,
                        AppColors.darkOrange,
                      ],
                    ),
                  ),
                  child: const GraphWidget(),
                ),
                const Expanded(child: SizedBox(height: 30)),
                Text(
                  "Send to motivate",
                  style: TextStyle(
                    color: Colors.orange.shade300.withOpacity(.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CupertinoButton(
                        child: const Text(
                          "😎",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      CupertinoButton(
                        child: const Text(
                          "🤟",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      CupertinoButton(
                        child: const Text(
                          "✊",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      CupertinoButton(
                        child: const Text(
                          "👊",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      CupertinoButton(
                        child: const Text(
                          "💪",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
