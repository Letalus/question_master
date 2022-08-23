import 'package:confetti/confetti.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:question_master/const/app_strings.dart';
import 'package:question_master/const/colors.dart';
import 'package:question_master/const/sizes.dart';
import 'package:question_master/core/domain/quiz_model.dart';
import 'package:question_master/core/provider/states/answered_state.dart';
import 'package:question_master/ui/shared/card_tile.dart';
import 'package:question_master/ui/shared/qm_elevated_button.dart';
import 'package:question_master/ui/widgets/question_screen/question_tile_correct_button.dart';
import 'package:question_master/ui/widgets/question_screen/question_tile_wrapper.dart';

class QuestionTile extends StatelessWidget {
  const QuestionTile(
      {Key? key,
      required this.page,
      required this.currentIndex,
      required this.quizModel,
      required this.onTapButton,
      required this.answeredState,
      required this.confettiController})
      : super(key: key);
  final double page;
  final int currentIndex;
  final QuizModel quizModel;

  ///Sends true if the answer was correct
  final ValueChanged<bool> onTapButton;
  final AnsweredState answeredState;
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
          if (answeredState is AnsweredWrong)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.tile.margin).copyWith(bottom: 40),
              child: Text(
                AppStrings.oops_wrong.tr(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red),
              ),
            ),
          if (answeredState is AnsweredCorrect)
            QuestionTileCorrectButton(confettiController: confettiController)
          else
            Row(
              children: [
                Expanded(
                    child: QmElevatedButton(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(SizeConfig.tile.borderRadius)),
                  title: AppStrings.false_tag.tr(),
                  onPressed: () => onTapButton(!quizModel.isCorrect),
                  backgroundColor: ThemeColors.button.grey,
                )),
                Expanded(
                    child: QmElevatedButton(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(SizeConfig.tile.borderRadius)),
                  title: AppStrings.true_tag.tr(),
                  onPressed: () => onTapButton(quizModel.isCorrect),
                )),
              ],
            )
        ],
      ),
    );
  }
}
