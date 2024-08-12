import 'package:flutter/material.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Contact/Componets/TextFild.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactFrom extends StatefulWidget {
  const ContactFrom({
    super.key,
  });

 

  @override
  State<ContactFrom> createState() => _ContactFromState();
}

class _ContactFromState extends State<ContactFrom>
    with SingleTickerProviderStateMixin {
 final TextEditingController emailController=TextEditingController();
  final TextEditingController nameController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController messageController=TextEditingController();


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
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text_Fild(
          controller: emailController,
          maxLines: 1,
          height: 100,
          cheight: 50,
          hintText: 'Email',
        ),
        const SizedBox(height: 20),
        Text_Fild(
          controller: nameController,
          maxLines: 1,
          height: 100,
          cheight: 50,
          hintText: 'Full Name',
        ),
        const SizedBox(height: 20),
        Text_Fild(
          controller: phoneController,
          maxLines: 1,
          height: 100,
          cheight: 50,
          hintText: 'SubJect',
        ),
        const SizedBox(height: 20),
        Text_Fild(
          controller: messageController,
          maxLines: 10,
          height: 200,
          cheight: 270,
          hintText: 'Message',
        ),
        const SizedBox(height: 20),
        OnHover(
          
          builder: (bool isHovered) { 
            return  AnimatedButton(
              email: emailController.text, 
              sub: phoneController.text, 
              message:nameController.text + messageController.text,);
           },
          )
      ],
    );
  }
}

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key, required this.email, required this.sub, required this.message});
final String email;
final String sub;
final String message;
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isTapped = false;

  void _toggleButton() {
   EmailSender.sendEmail(
                toEmail:widget.email ,
                subject: widget.sub,
                body: widget.message,
              );
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleButton,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: _isTapped ? Colors.blue : Colors.pinkAccent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: _isTapped
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.6),
                    offset: const Offset(0, 4),
                    blurRadius: 15,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.pinkAccent.withOpacity(0.6),
                    offset: const Offset(0, 4),
                    blurRadius: 15,
                  ),
                ],
        ),
        child: const Text(
          "Send",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class OnHover extends StatefulWidget {

  final Widget Function(bool isHovered) builder;

  const OnHover({super.key, required this.builder});

  @override
  _OnHoverState createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {

  bool isHovered = false;
  @override
  Widget build(BuildContext context) {

    final hovered = Matrix4.identity()..translate(0,-10,0);
    final transform = isHovered ? hovered : Matrix4.identity();

    return MouseRegion(
      onEnter: (_)=> onEntered(true),
      onExit: (_)=> onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered){
    setState(() {
      this.isHovered = isHovered;
    });
  }
}


class EmailSender {
  // Function to send an email
  static Future<void> sendEmail({
    required String toEmail,
    required String subject,
    required String body,
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    // Checking if the email app is available on the device
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}