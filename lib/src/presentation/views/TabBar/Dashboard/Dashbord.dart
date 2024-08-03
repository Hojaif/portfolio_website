import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Dashboard/Componets/Discription.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Dashboard/Componets/DownloadButton.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Dashboard/Componets/SubTitle.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Dashboard/Componets/TitleText.dart';

import '../../../../utils/Colors.dart';
import '../../../widgets/Responsive.dart';
import 'Componets/AnimatedImageContainer.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final double paddingValue = !Responsive.isMobile(context) &&
            !Responsive.isLargeMobile(context) &&
            !Responsive.isExtraLargeScreen(context)
        ? 100
        : 16;

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!Responsive.isDesktop(context))
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                    if (!Responsive.isDesktop(context))
                      // Photo
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.23,
                          ),
                          const AnimatedImageContainer(
                            width: 160,
                            height: 210,
                          ),
                        ],
                      ),
                    // Title
                    if (!Responsive.isDesktop(context))
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                    const Responsive(
                        desktop: TitleText(start: 40, end: 50),
                        largeMobile: TitleText(start: 40, end: 35),
                        mobile: TitleText(start: 35, end: 30),
                        tablet: TitleText(start: 50, end: 40)),
                    if (kIsWeb && Responsive.isLargeMobile(context))
                      Container(
                        height: defaultPadding,
                        color: const Color.fromARGB(0, 0, 0, 0),
                      ),
                    // Sub Title
                    const CombineSubtitleText(),
                    const SizedBox(height: defaultPadding / 1),
                    const Responsive(
                      desktop: Dicription(start: 14, end: 15),
                      largeMobile: Dicription(start: 14, end: 12),
                      mobile: Dicription(start: 14, end: 12),
                      tablet: Dicription(start: 17, end: 14),
                    ),
                    const SizedBox(
                      height: defaultPadding * 2,
                    ),
                    const DownloadButton(),
                    const SizedBox(
                      width: defaultPadding * 1,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            if (Responsive.isDesktop(context)) const AnimatedImageContainer(),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
