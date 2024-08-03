
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
          "Flutter skills to achieve positive results for your previous employers. Flutter skills to achieve positive results for your previous employers. For example, you can mention, I have previously worked on seven Flutter projects and launched three apps. Two apps have over 20,000 downloads with 1000+ five-star ratings from happy users. This article is based on information available at the time of writing, which may change at any time. Indeed does not guarantee that this information is always up-to-date. Please seek out a local resource for the latest on this topic.",
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
