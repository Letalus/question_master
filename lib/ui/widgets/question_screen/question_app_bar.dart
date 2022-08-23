import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:question_master/const/app_strings.dart';
import 'package:question_master/const/colors.dart';
import 'package:question_master/core/services/navigation_service.dart';

class QuestionAppBar extends AppBar {
  final int correctAnswerCounter;
  final VoidCallback onSkip;

  QuestionAppBar({Key? key, required this.correctAnswerCounter, required this.onSkip})
      : super(
          key: key,
          title: Text(
            AppStrings.question_master.tr(),
          ),
          centerTitle: true,
          leading: TextButton(
              onPressed: () {
                onSkip();
              },
              child: Text(
                AppStrings.skip.tr(),
                style: Theme.of(navigationContext)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(navigationContext).textTheme.bodyMedium!.color!.withOpacity(.3), fontWeight: FontWeight.w200),
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    correctAnswerCounter.toString(),
                    style: Theme.of(navigationContext).textTheme.bodyMedium!.copyWith(color: ThemeColors.base.gold),
                  ),
                  Icon(
                    Icons.star_rate_rounded,
                    color: ThemeColors.base.gold,
                  ),
                ],
              ),
            )
          ],
        );
}
