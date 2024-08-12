
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "About",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: " ",
                style: TextStyle(fontSize: 16),
              ),
              TextSpan(
                text: "Me",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Flutter Developer",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        const ReadMoreText(
          "I am a Flutter developer, I am skilled in cross platform app design and development. I have experience in developing apps successfully in various projects. I am good at finding optimal solutions and building smooth, fast and user-friendly apps using Flutter framework.I am also skilled in creating beautiful smooth, fast and user-friendly websites with Flutter.",
          trimLines: 4,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
