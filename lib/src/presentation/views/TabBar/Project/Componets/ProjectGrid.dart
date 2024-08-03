import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../domain/Controller/ProjectController.dart';
import '../../../../../domain/Model/Project_Model.dart';
import '../../../../../utils/Colors.dart';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  ProjectGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});
  final controller = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: projectList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, childAspectRatio: ratio),
      itemBuilder: (context, index) {
        return Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(
                vertical: defaultPadding, horizontal: defaultPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(colors: [
                  Colors.pinkAccent,
                  Colors.blue,
                ]),
                image: DecorationImage(
                    image: AssetImage(projectList[index].image),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink,
                    offset: const Offset(-2, 0),
                    blurRadius: controller.hovers[index] ? 20 : 10,
                  ),
                  BoxShadow(
                    color: Colors.blue,
                    offset: const Offset(2, 0),
                    blurRadius: controller.hovers[index] ? 20 : 10,
                  ),
                ]),
            child: InkWell(
              onHover: (value) {
                controller.onHover(index, value);
              },
              onTap: () {
                // ImageViewer(context,projectList[index].image);
              },
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              launchUrl(Uri.parse(projectList[index].link));
                            },
                            icon: SvgPicture.asset('assets/icons/github.svg')),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          launchUrl(Uri.parse(projectList[index].link));
                        },
                        child: const Text(
                          'Read More>>',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ))
                  ],
                ),
              ),
              /*   AnimatedContainer(
                padding: const EdgeInsets.only(
                    left: defaultPadding,
                    right: defaultPadding,
                    top: defaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: bgColor),
                duration: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Align(
                    //   alignment: Alignment.topCenter,
                    //   child: Text(
                    //     projectList[index].name,
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .headlineSmall!
                    //         .copyWith(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold),
                    //     maxLines: 1,
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    // ),
                    Responsive.isMobile(context)
                        ? const SizedBox(
                            height: defaultPadding / 2,
                          )
                        : const SizedBox(
                            height: defaultPadding,
                          ),
                    // Text(projectList[index].description,style: const TextStyle(color: Colors.grey,height: 1.5),maxLines: size.width>700 && size.width< 750 ? 3:  size.width<470  ? 2  : size.width>600 && size.width<700 ?     6:  size.width>900 && size.width <1060 ? 6: 4 ,overflow: TextOverflow.ellipsis,),
                    const Spacer(),
                    Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  launchUrl(Uri.parse(projectList[index].link));
                                },
                                icon: SvgPicture.asset(
                                    'assets/icons/github.svg')),
                          ],
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              launchUrl(Uri.parse(projectList[index].link));
                            },
                            child: const Text(
                              'Read More>>',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                  ],
                ),
              ),*/
            )));
      },
    );
  }
}
