import 'package:flutter/material.dart';

import '../../../../../utils/Colors.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer({Key? key, this.height = 300, this.width = 250})
      : super(key: key);
  final double? width;
  final double? height;
  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}

class AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, 2 * value), // Move the container up and down
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(defaultPadding / 4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Colors.pinkAccent,
                Colors.blue,
              ]),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink,
                  offset: Offset(-2, 0),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(2, 0),
                  blurRadius: 20,
                ),
              ],
            ),
            child:Container(
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle
              ),
              child: ClipOval(
                child: Image.network(
                  'https://i.postimg.cc/9MPK7vQv/Whats-App-Image-2024-06-11-at-10-21-56-PM-removebg-preview-1.png',
                  height: 20,
                  /*Responsive.isLargeMobile(context)
                      ? MediaQuery.sizeOf(context).width * 0.2
                      : Responsive.isTablet(context)
                          ? MediaQuery.sizeOf(context).width * 0.2
                          : 200,*/
                  width:20
                  /* Responsive.isLargeMobile(context)
                      ? MediaQuery.sizeOf(context).width * 0.2
                      : Responsive.isTablet(context)
                          ? MediaQuery.sizeOf(context).width * 0.14
                          : 200,
                  fit: BoxFit.cover,*/
                ),
              ),
            )
            
          ),
        );
      },
    );
  }
}
