import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:question_master/const/app_strings.dart';
import 'package:question_master/const/asset_paths.dart';
import 'package:question_master/const/colors.dart';
import 'package:question_master/const/sizes.dart';
import 'package:question_master/core/services/navigation_service.dart';
import 'package:question_master/ui/screens/explanation_screen.dart';
import 'package:question_master/ui/shared/card_tile.dart';
import 'package:question_master/ui/shared/card_tile_wrapper.dart';
import 'package:question_master/ui/shared/qm_elevated_button.dart';
import 'package:question_master/ui/widgets/question_screen/question_tile_animation.dart';

class QuestionFinishedTile extends StatelessWidget {
  final double page;
  final int currentIndex;
  final VoidCallback startQuizAgain;

  const QuestionFinishedTile({Key? key, required this.page, required this.currentIndex, required this.startQuizAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardTileWrapper(
      child: QuestionTileAnimation(
          page: page,
          currentIndex: currentIndex,
          child: CardTile(
            text: AppStrings.congratulation.tr(),
            assetImage: AssetPaths.image.celebration,
            belowTextWidget: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.tile.margin).copyWith(bottom: 40),
                child: TextButton(
                  onPressed: () {
                    NavigationService.instance.navigateTo(ExplanationScreen.routeName);
                  },
                  child: Text(
                    AppStrings.wanna_know_more.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ThemeColors.base.gold),
                  ),
                ),
              ),
              QmElevatedButton(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(SizeConfig.tile.borderRadius)),
                  onPressed: () {
                    startQuizAgain();
                  },
                  title: AppStrings.lets_do_it_again.tr())
            ],
          )),
    );
  }
}
