import 'package:flutter/material.dart';

class Text_Fild extends StatelessWidget {
  const Text_Fild({
    super.key,
    required this.controller,
    required this.height,
    required this.maxLines, required this.cheight, required this.hintText,
  });
  final TextEditingController controller;
  final double height;
  final double cheight;
  final int maxLines;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: cheight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [Colors.blue.shade200, Colors.pink.shade200])),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: TextField(
          controller: controller,
          maxLines: maxLines,
          
        decoration:  InputDecoration(
          border: InputBorder.none,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
          hintText:hintText,
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16
        ),
        ),
      ),
    );
  }
}
