import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:question_master/const/app_strings.dart';
import 'package:question_master/const/colors.dart';
import 'package:question_master/const/sizes.dart';
import 'package:question_master/core/domain/quiz_model.dart';
import 'package:question_master/ui/shared/card_tile.dart';
import 'package:question_master/ui/shared/qm_elevated_button.dart';
import 'package:question_master/ui/widgets/question_screen/question_tile_wrapper.dart';

class QuestionTile extends StatelessWidget {
  const QuestionTile(
      {Key? key,
      required this.page,
      required this.currentIndex,
      required this.quizModel,
      required this.onTapButton,
      required this.isAnsweredWrong,
      required this.isAnsweredCorrect,
      required this.confettiController})
      : super(key: key);
  final double page;
  final int currentIndex;
  final QuizModel quizModel;

  ///Sends true if the answer was correct
  final ValueChanged<bool> onTapButton;
  final bool isAnsweredWrong;
  final bool isAnsweredCorrect;
  final ConfettiController confettiController;

  @override
  Widget build(BuildContext context) {
    return QuestionTileWrapper(
      page: page,
      currentIndex: currentIndex,
      child: CardTile(
        assetImage: quizModel.image,
        text: quizModel.question,
        belowTextWidget: [
          if (isAnsweredWrong)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.tile.margin).copyWith(bottom: 40),
              child: Text(
                AppStrings.oops_wrong.tr(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red),
              ),
            ),
          isAnsweredCorrect
              ? Column(
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
                )
              : Row(
                  children: [
                    Expanded(
                        child: QmElevatedButton(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(SizeConfig.tile.borderRadius)),
                      title: AppStrings.false_tag.tr(),
                      onPressed: () => onTapButton(quizModel.correctAnswerPosition == 0),
                      backgroundColor: ThemeColors.button.grey,
                    )),
                    Expanded(
                        child: QmElevatedButton(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(SizeConfig.tile.borderRadius)),
                      title: AppStrings.true_tag.tr(),
                      onPressed: () => onTapButton(quizModel.correctAnswerPosition == 1),
                    )),
                  ],
                )
        ],
      ),
    );
  }
}
