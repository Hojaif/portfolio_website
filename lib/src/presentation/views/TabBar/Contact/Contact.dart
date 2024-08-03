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
  final TextEditingController emailController1 = TextEditingController();
  final TextEditingController nameController1 = TextEditingController();
  final TextEditingController phoneController1 = TextEditingController();
  final TextEditingController messageController1 = TextEditingController();
  final TextEditingController emailController2 = TextEditingController();
  final TextEditingController nameController2 = TextEditingController();
  final TextEditingController phoneController2 = TextEditingController();
  final TextEditingController messageController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(100),
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
              Responsive(
                desktop: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContactFrom(
                      emailController1: emailController1,
                      nameController1: nameController1,
                      phoneController1: phoneController1,
                      messageController1: messageController1),
                  const SizedBox(
                    width: 16,
                  ),
                  const ContactDetiles(),
                ],
              ),
                largeMobile: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContactDetiles(),
                  const SizedBox(
                    width: 16,
                  ),
                  ContactFrom(
                      emailController1: emailController1,
                      nameController1: nameController1,
                      phoneController1: phoneController1,
                      messageController1: messageController1),
                  
                  
                ],
              ), 
                mobile: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContactDetiles(),
                  const SizedBox(
                    width: 16,
                  ),
                  ContactFrom(
                      emailController1: emailController1,
                      nameController1: nameController1,
                      phoneController1: phoneController1,
                      messageController1: messageController1),
                  
                  
                ],
              ),
                tablet: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContactFrom(
                      emailController1: emailController1,
                      nameController1: nameController1,
                      phoneController1: phoneController1,
                      messageController1: messageController1),
                  const SizedBox(
                    width: 16,
                  ),
                  const ContactDetiles(),
                ],
              ),)
              
            ],
          ),
        ),
      ),
    );
  }
}
