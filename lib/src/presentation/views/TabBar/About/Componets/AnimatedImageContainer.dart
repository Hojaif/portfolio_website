import 'package:flutter/material.dart';

import '../../../../../utils/Colors.dart';

class AnimatedImageContainer extends StatelessWidget {
  const AnimatedImageContainer({
    super.key,
    required AnimationController animationController,
    required this.height,
    required this.width,
  }) : _animationController = animationController;

  final AnimationController _animationController;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final value = _animationController.value;
        return Transform.translate(
          offset: Offset(0, 2 * value), // Move the container up and down
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.all(defaultPadding / 4),
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              gradient: SweepGradient(
                colors: const [Colors.pinkAccent, Colors.blue],
                transform: GradientRotation(_animationController.value * 6),
              ),
            ),
            child: Container(
              color: bgColor,
            ),
          ),
        );
      },
    );
  }
}