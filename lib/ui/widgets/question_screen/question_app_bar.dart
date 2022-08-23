import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:question_master/const/app_strings.dart';

class QuestionAppBar extends AppBar {
  final int correctAnswerCounter;

  QuestionAppBar({Key? key, required this.correctAnswerCounter})
      : super(key: key,
          title: Text(
            AppStrings.question_master.tr(),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    correctAnswerCounter.toString(),
                    style: TextStyle(color: Colors.yellow[800], fontSize: 20),
                  ),
                  Icon(
                    Icons.star_rate_rounded,
                    color: Colors.yellow[800],
                  ),
                ],
              ),
            )
          ],
        );
}
