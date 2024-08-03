import 'package:flutter/material.dart';
import 'package:protfolioweb/src/utils/Colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.selectedIndex,
    required this.homeTab,
    required this.aboutTab,
    required this.serviesTab,
    required this.portfolioTab,
    required this.contactTab,
  });

  final int selectedIndex;
  final VoidCallback homeTab;
  final VoidCallback aboutTab;
  final VoidCallback serviesTab;
  final VoidCallback portfolioTab;
  final VoidCallback contactTab;

  @override
  Widget build(BuildContext context) {
    double topOffset = 43.0;
    switch (selectedIndex) {
      case 0:
        topOffset = 43.0;
        break;
      case 1:
        topOffset = 93.0;
        break;
      case 2:
        topOffset = 143.0;
        break;
      case 3:
        topOffset = 190.0;
        break;
      case 4:
        topOffset = 240.0;
        break;
    }

    return Scaffold(
      body: Container(
        width: 250,
        decoration: const BoxDecoration(
          color: bgColor,
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.blue],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Positioned(
                top: topOffset,
                height: 40,
                width: 200,
                child: Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              
              Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  _buildDrawerItem("Home", 0, homeTab),
                  _buildDrawerItem("About", 1, aboutTab),
                  _buildDrawerItem("Services", 2, serviesTab),
                  _buildDrawerItem("Portfolio", 3, portfolioTab),
                  _buildDrawerItem("Contact", 4, contactTab),
                  const Spacer(),
                ],
              ),
               const Positioned(
                top:0,
                left: 0,
                 child: Text(
                        "Portfolio",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                        ),
               ),
              Positioned(
                top:-10,
                right: -10,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, int index, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}
