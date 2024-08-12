import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../widgets/Responsive.dart';

class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog({super.key, required this.name, required this.dicrption});
final String name;
final String dicrption;
  @override
  _AnimatedDialogState createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    ));
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation!,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      ),
    );
  }

  dialogContent(BuildContext context) {
    final double paddingValue = !Responsive.isMobile(context) &&
            !Responsive.isLargeMobile(context) &&
            !Responsive.isExtraLargeScreen(context)
        ? 100
        : 16;
    return Stack(
      children: <Widget>[
        Container(
          width: 500,
          padding: EdgeInsets.all(paddingValue),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
               const BoxShadow(
                color: Colors.white,
                blurRadius: 10.0,
                offset:  Offset(0.0, 10.0),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: <Widget>[
                 Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16.0),
                 ReadMoreText(
                  widget.dicrption,
            trimLines: 4,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Show less',
            moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                const SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    child: const Text("Close"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
