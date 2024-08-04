import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Blogs/Blogs.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Contact/Contact.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Dashboard/Componets/MuneButton.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Dashboard/Dashbord.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/About/About.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Project/Project.dart';
import 'package:protfolioweb/src/presentation/widgets/CustomDrawer.dart';
import 'package:protfolioweb/src/utils/Colors.dart';

import '../widgets/Responsive.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const Dashbord(),
      const About(),
      Project(),
      // This screen Call Blogs Screen
      const Blogs(),
      const Contact()
    ];
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Row(
            children: [
              Image.asset(
                "assets/images/triange_icon.png",
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "BD IT HOST",
                style: GoogleFonts.adamina(color: Colors.white),
              )
            ],
          ),
        ),
        centerTitle: false,
        backgroundColor: bgColor,
        actions: [
          if (!Responsive.isExtraLargeScreen(context) &&
              !Responsive.isLargeMobile(context) &&
              !Responsive.isMobile(context))
            Row(
              children: [
                TextButton(
                  onPressed: () => _onItemTapped(0),
                  child: Text(
                    "Home",
                    style: TextStyle(
                      color: _selectedIndex == 0 ? Colors.blue : Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _onItemTapped(1),
                  child: Text(
                    "About",
                    style: TextStyle(
                      color: _selectedIndex == 1 ? Colors.blue : Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _onItemTapped(2),
                  child: Text(
                    "Portfolio",
                    style: TextStyle(
                      color: _selectedIndex == 2 ? Colors.blue : Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _onItemTapped(3),
                  child: Text(
                    "Blogs",
                    style: TextStyle(
                      color: _selectedIndex == 3 ? Colors.blue : Colors.white,
                    ),
                  ),
                ),
                
                TextButton(
                  onPressed: () => _onItemTapped(4),
                  child: Text(
                    "Contact",
                    style: TextStyle(
                      color: _selectedIndex == 4 ? Colors.blue : Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.height * 0.25,
                ),
              ],
            )
          else
          // MenuButton 
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8),
              child: MenuButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomDrawer(
                        selectedIndex: _selectedIndex,
                        homeTab: () => _onDrawerItemTapped(0),
                        aboutTab: () => _onDrawerItemTapped(1),
                        serviesTab: () => _onDrawerItemTapped(2),
                        portfolioTab: () => _onDrawerItemTapped(3),
                        contactTab: () => _onDrawerItemTapped(4),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        // / Web side er sob kaj hole scrollDirection dile hobe

        // scrollDirection: Axis.vertical,
        children: screens,
      ),
    );
  }
// MenuButton Fanction
  void _onDrawerItemTapped(int index) {
    Navigator.pop(context);
    _onItemTapped(index);
  }
}
