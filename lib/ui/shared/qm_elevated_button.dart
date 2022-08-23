import 'package:flutter/material.dart';
import 'package:question_master/const/colors.dart';

class QmElevatedButton extends StatelessWidget {
  const QmElevatedButton(
      {Key? key, required this.borderRadius, required this.onPressed, required this.title, this.backgroundColor})
      : super(key: key);

  final BorderRadius borderRadius;
  final VoidCallback onPressed;
  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius)),
            backgroundColor: backgroundColor != null ? MaterialStateProperty.all(backgroundColor!) : null),
        child: SizedBox(
            height: 50,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ThemeColors.text.fontWhite),
                ))));
  }
}
