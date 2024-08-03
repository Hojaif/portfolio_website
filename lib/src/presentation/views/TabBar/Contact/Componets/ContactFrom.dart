import 'package:flutter/material.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Contact/Componets/TextFild.dart';

import '../../../../../utils/Colors.dart';

class ContactFrom extends StatefulWidget {
  const ContactFrom({
    super.key,
    required this.emailController1,
    required this.nameController1,
    required this.phoneController1,
    required this.messageController1,
  });

  final TextEditingController emailController1;
  final TextEditingController nameController1;
  final TextEditingController phoneController1;
  final TextEditingController messageController1;

  @override
  State<ContactFrom> createState() => _ContactFromState();
}

class _ContactFromState extends State<ContactFrom>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

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
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text_Fild(
            controller: widget.emailController1,
            maxLines: 1,
            height: 100,
            cheight: 50,
            hintText: 'Email',
          ),
          const SizedBox(height: 20),
          Text_Fild(
            controller: widget.nameController1,
            maxLines: 1,
            height: 100,
            cheight: 50,
            hintText: 'Full Name',
          ),
          const SizedBox(height: 20),
          Text_Fild(
            controller: widget.phoneController1,
            maxLines: 1,
            height: 100,
            cheight: 50,
            hintText: 'Phone Number',
          ),
          const SizedBox(height: 20),
          Text_Fild(
            controller: widget.messageController1,
            maxLines: 10,
            height: 200,
            cheight: 270,
            hintText: 'Message',
          ),
          const SizedBox(height: 20),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              final value = _animationController.value;
              return Transform.translate(
                offset: Offset(0, 2 * value),
                child: Container(
                  height: 40,
                  width: 130,
                  padding: const EdgeInsets.all(defaultPadding / 4),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    gradient: SweepGradient(
                      colors: const [Colors.pinkAccent, Colors.blue],
                      transform:
                          GradientRotation(_animationController.value * 6),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
