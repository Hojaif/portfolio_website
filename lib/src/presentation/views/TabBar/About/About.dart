import 'package:flutter/material.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/About/Componets/AboutText.dart';
import '../../../../utils/Colors.dart';
import '../../../widgets/Responsive.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.forward(from: 0);
      }
    });

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double paddingValue = !Responsive.isMobile(context) &&
            !Responsive.isLargeMobile(context) &&
            !Responsive.isExtraLargeScreen(context)
        ? 100
        : 16;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
                child: Text(
              "Contact Me",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(paddingValue),
              child: Responsive(
                desktop: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedImageContainer(
                      animationController: _animationController,
                      height: 350,
                      width: 300,
                    ),
                    const SizedBox(width: 20),
                    const Expanded(child: AboutText()),
                  ],
                ),
                largeMobile: Column(
                  children: [
                    AnimatedImageContainer(
                      animationController: _animationController,
                      height: 250,
                      width: 200,
                    ),
                    const SizedBox(height: 20),
                    const AboutText(),
                  ],
                ),
                mobile: Column(
                  children: [
                    AnimatedImageContainer(
                      animationController: _animationController,
                      height: 250,
                      width: 200,
                    ),
                    const SizedBox(height: 20),
                    const AboutText(),
                  ],
                ),
                tablet: Column(
                  children: [
                    AnimatedImageContainer(
                      animationController: _animationController,
                      height: 270,
                      width: 220,
                    ),
                    const SizedBox(height: 20),
                    const AboutText(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          offset: Offset(0, 2 * value),
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.all(defaultPadding / 4),
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              gradient: SweepGradient(
                colors: const [
                  Colors.pinkAccent,
                  Colors.blue,
                  bgColor,
                ],
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
