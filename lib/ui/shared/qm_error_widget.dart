import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:question_master/const/app_strings.dart';

class QmErrorWidget extends StatelessWidget {

  final dynamic error;

  const QmErrorWidget({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(AppStrings.some_error_happened.tr(args: [error.toString()])),
    );
  }
}
