import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../widgets/Responsive.dart';

class ContactDetiles extends StatelessWidget {
  const ContactDetiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double heightValue = !Responsive.isMobile(context) &&
            !Responsive.isLargeMobile(context) &&
            !Responsive.isExtraLargeScreen(context)
        ? 30
        : 20;
    final double widthValue = !Responsive.isMobile(context) &&
            !Responsive.isLargeMobile(context) &&
            !Responsive.isExtraLargeScreen(context)
        ? 30
        : 20;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ListTile(
          title: Text(
            "Email",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          subtitle: Text("hh.hojaifa78@gmail.com"),
        ),
        const SizedBox(
          height: 20,
        ),
        const ListTile(
          title: Text(
            "Phone",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          subtitle: Text("01611082127"),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/github.svg",
                  height: heightValue,
                  width: widthValue,
                )),
            const SizedBox(
              height: 20,
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/github.svg",
                  height: heightValue,
                  width: widthValue,
                )),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/linkedin.svg",
                  height: heightValue,
                  width: widthValue,
                )),
          ],
        )
      ],
    );
  }
}
