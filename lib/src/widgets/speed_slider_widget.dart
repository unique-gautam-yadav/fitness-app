import 'package:flutter/material.dart';

class SpeedSlider extends StatefulWidget {
  const SpeedSlider({
    super.key,
    this.onChanged,
  });

  @override
  State<SpeedSlider> createState() => _SpeedSliderState();

  final Function(double val)? onChanged;
}

class _SpeedSliderState extends State<SpeedSlider> {
  double v = .52;
  @override
  void initState() {
    super.initState();
    if (widget.onChanged != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        widget.onChanged!(.52);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(122),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double m = constraints.maxWidth;

          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                top: 1.5,
                left: m * v,
                child: GestureDetector(
                  onPanUpdate: (d) {
                    double p = d.globalPosition.dx - 70;

                    double vv = p / m;

                    if (vv > 0 && vv < .85) {
                      setState(() {
                        v = vv;
                      });
                      if (widget.onChanged != null) {
                        widget.onChanged!(vv);
                      }
                    }
                  },
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
