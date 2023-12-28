import 'package:flutter/material.dart';

class FadeInAnimationTTD extends StatefulWidget {
  const FadeInAnimationTTD({super.key, required this.child, required this.delay});

  final Widget child;
  final double delay;

  @override
  State<FadeInAnimationTTD> createState() => _FadeInAnimationTTDState();
}

class _FadeInAnimationTTDState extends State<FadeInAnimationTTD>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: (500 * widget.delay).round()),
        vsync: this);
    animation2 = Tween<double>(begin: -40, end: 0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Transform.translate(
      offset: Offset(0, animation2.value),
      child: Opacity(
        opacity: animation.value,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
