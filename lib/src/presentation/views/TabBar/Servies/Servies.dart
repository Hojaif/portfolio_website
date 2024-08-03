
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../widgets/Responsive.dart';

class Servies extends StatefulWidget {
  const Servies({super.key});

  @override
  State<Servies> createState() => _ServiesState();
}

class _ServiesState extends State<Servies> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
            desktop: AnimatedText(start: 30, end: 40, gradient: false),
            largeMobile:
                AnimatedText(start: 30, end: 25, gradient: false),
            mobile: AnimatedText(start: 25, end: 20, gradient: true),
            tablet: AnimatedText(start: 40, end: 30, gradient: false),
          );
  }
}



class AnimatedText extends StatelessWidget {
  final double start;
  final double end;
  final bool gradient;

  const AnimatedText({
    Key? key,
    required this.start,
    required this.end,
    this.gradient = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween(begin: start, end: end),
        duration: const Duration(milliseconds: 200),
        builder: (context, value, child) {
          return AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TyperAnimatedText(
                'Comming Soon ........',
                textStyle: TextStyle(fontSize: value,color: Colors.white),
              ),
              
            ],
            onTap: () {
              print("I am executing");
            },
          );
        },
      ),
    );
  }
}
