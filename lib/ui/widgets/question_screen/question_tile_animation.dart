import 'package:flutter/material.dart';

class QuestionTileAnimation extends StatelessWidget {
  final double page;
  final int currentIndex;
  final Widget child;

  const QuestionTileAnimation({Key? key, required this.page, required this.currentIndex, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageToIndexDifference = currentIndex - page;
    return Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Transform.rotate(
                angle: pageToIndexDifference,
                child: Transform.translate(
                    offset: Offset(pageToIndexDifference * 500, pageToIndexDifference * 1000),
                    child: Align(
                        alignment: Alignment.center,
                        child: child)))));
  }
}
