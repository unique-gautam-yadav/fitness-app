import 'package:flutter/material.dart';

import '../style/colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -100,
          right: -100,
          width: 200,
          height: 200,
          child: Transform.scale(
            scale: 4,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.bgOrange,
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -100,
          left: 50,
          width: 200,
          height: 200,
          child: Transform.scale(
            scale: 4,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.bgOrange,
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 90,
          right: -300,
          width: 400,
          height: 400,
          child: Transform.scale(
            scale: 4,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.bgOrange,
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}
