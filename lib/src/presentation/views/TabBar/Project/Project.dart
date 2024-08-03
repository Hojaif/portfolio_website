import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Project/Componets/ProjectGrid.dart';

import '../../../../domain/Controller/ProjectController.dart';
import '../../../widgets/Responsive.dart';

class Project extends StatelessWidget {
  Project({super.key});
  final controller = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isMobile(context))
            const SizedBox(
              height: 30.0,
            ),
          // const TitleText(prefix: 'Latest', title: 'Projects'),
          // const SizedBox(
          //   height: defaultPadding,
          // ),
          Expanded(
            child: Responsive(
                desktop: ProjectGrid(
                  crossAxisCount: 3,
                ),
                extraLargeScreen: ProjectGrid(
                  crossAxisCount: 4,
                ),
                largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 1.8),
                mobile: ProjectGrid(crossAxisCount: 1, ratio: 1.5),
                tablet: ProjectGrid(
                  ratio: 1.4,
                  crossAxisCount: 2,
                )),
          )
        ],
      ),
    );
  }
}
