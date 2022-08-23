import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:question_master/const/app_strings.dart';
import 'package:question_master/const/asset_paths.dart';
import 'package:question_master/const/colors.dart';
import 'package:question_master/const/sizes.dart';
import 'package:question_master/core/services/navigation_service.dart';
import 'package:question_master/ui/shared/card_tile.dart';
import 'package:question_master/ui/shared/card_tile_wrapper.dart';
import 'package:question_master/ui/shared/qm_scaffold.dart';

///Explains the reason why this app has been
class ExplanationScreen extends StatefulWidget {
  static const String routeName = 'explain screen';

  const ExplanationScreen({Key? key}) : super(key: key);

  @override
  State<ExplanationScreen> createState() => _ExplanationScreenState();
}

class _ExplanationScreenState extends State<ExplanationScreen> {
  @override
  Widget build(BuildContext context) {
    return QmScaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.why_this_app.tr(),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: CardTileWrapper(
          child: CardTile(
            assetImage: AssetPaths.image.horror,
            text: AppStrings.app_was_written_because.tr(),
            belowTextWidget: [
              TextButton(
                  onPressed: () {
                    NavigationService.instance.pop();
                  },
                  child: Text(
                    AppStrings.enjoy.tr(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ThemeColors.base.gold),
                  )),
              SizedBox(
                height: SizeConfig.tile.margin,
              )
            ],
          ),
        ));
  }
}
