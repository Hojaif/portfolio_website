import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedSubtitleText extends StatelessWidget {
  final double start;
  final double end;
  final bool gradient;

  const AnimatedSubtitleText({
    Key? key,
    required this.start,
    required this.end,
    this.gradient = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText(
              'Flutter Developer',
              textStyle: TextStyle(fontSize: value),
            ),
            TyperAnimatedText(
              'Mobile Application Developer',
              textStyle: TextStyle(fontSize: value),
            ),
            TyperAnimatedText(
              'Frontend Developer',
              textStyle: TextStyle(fontSize: value),
            ),
          ],
          onTap: () {
            print("I am executing");
          },
        );
      },
    );
  }
}
