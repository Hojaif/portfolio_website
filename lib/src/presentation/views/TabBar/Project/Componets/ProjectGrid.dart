import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:protfolioweb/src/presentation/views/TabBar/Project/Componets/Dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../domain/Controller/ProjectController.dart';
import '../../../../../domain/Model/Project_Model.dart';
import '../../../../../utils/Colors.dart';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  ProjectGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});
  final controller = Get.put(ProjectController());
  void showAnimatedDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AnimatedDialog(
          name: projectList[index].name,
          dicrption: projectList[index].description,
        );
      },
    );
  }

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
                // Product Image
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
                showImageViewer(context, projectList[index].image);
              },
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Github Button
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  launchUrl(Uri.parse(projectList[index].link));
                                },
                                icon: SvgPicture.asset(
                                  'assets/icons/github.svg',
                                  color: Colors.black,
                                )),
                          ],
                        ),
                        const Spacer(),
                        // More Button
                        TextButton(
                            onPressed: () {
                              showAnimatedDialog(context, index);
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
                  ],
                ),
              ),
            )));
      },
    );
  }

  void showImageViewer(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
