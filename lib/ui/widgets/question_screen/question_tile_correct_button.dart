import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:question_master/const/app_strings.dart';
import 'package:question_master/const/colors.dart';
import 'package:question_master/const/sizes.dart';

class QuestionTileCorrectButton extends StatelessWidget {
  const QuestionTileCorrectButton({Key? key, required this.confettiController}) : super(key: key);
  final ConfettiController confettiController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            ConfettiWidget(
                confettiController: confettiController,
                numberOfParticles: 200,
                blastDirection: pi * 1.5,
                emissionFrequency: 0.0,
                maxBlastForce: 30,
                minBlastForce: 5,
                gravity: .1,
                child: const SizedBox()),
            const Spacer()
          ],
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(SizeConfig.tile.borderRadius)),
              color: Theme.of(context).primaryColor),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              AppStrings.awesome.tr(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ThemeColors.text.fontWhite),
            ),
          ),
        ),
      ],
    );
  }
}
