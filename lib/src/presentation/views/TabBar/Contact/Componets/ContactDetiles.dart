import 'package:flutter/material.dart';

class ContactDetiles extends StatelessWidget {
  const ContactDetiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              "Email",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            subtitle: Text("hh.hojaifa78@gmail.com"),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              "Phone",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            subtitle: Text("01611082127"),
          )
        ],
      ),
    );
  }
}
