import 'package:flutter/material.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Dashboard/Componets/AnimatedSubtitleText.dart';
import '../../../../widgets/Responsive.dart';

class CombineSubtitleText extends StatelessWidget {
  const CombineSubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(colors: [
              Colors.pink,
              Colors.blue,
            ]).createShader(bounds);
          },
          child: const Responsive(
            desktop: AnimatedSubtitleText(start: 30, end: 40, gradient: false),
            largeMobile:
                AnimatedSubtitleText(start: 30, end: 25, gradient: false),
            mobile: AnimatedSubtitleText(start: 25, end: 20, gradient: true),
            tablet: AnimatedSubtitleText(start: 40, end: 30, gradient: false),
          ),
        )
      ],
    );
  }
}
