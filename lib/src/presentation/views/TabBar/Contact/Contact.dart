import 'package:flutter/material.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Contact/Componets/ContactDetiles.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Contact/Componets/ContactFrom.dart';
import 'package:protfolioweb/src/presentation/widgets/Responsive.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final double paddingValue = !Responsive.isMobile(context) &&
            !Responsive.isLargeMobile(context) &&
            !Responsive.isExtraLargeScreen(context)
        ? 100
        : 16;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(paddingValue),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Contact Me",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Responsive(
                desktop: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ContactFrom(
                      
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(child: ContactDetiles()),
                  ],
                ),
                largeMobile: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ContactDetiles(),
                    const SizedBox(height: 16),
                    ContactFrom(
                     
                    ),
                  ],
                ),
                mobile: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ContactDetiles(),
                    const SizedBox(height: 16),
                    ContactFrom(
                 
                    ),
                  ],
                ),
                tablet: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ContactFrom(
                    
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(child: ContactDetiles()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
