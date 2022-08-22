import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:question_master/const/app_strings.dart';
import 'package:question_master/const/asset_paths.dart';
import 'package:question_master/core/services/navigation_service.dart';

///Explains the reason why this app has been
class ExplainScreen extends StatefulWidget {
  static const String routeName = 'explain screen';
  const ExplainScreen({Key? key}) : super(key: key);

  @override
  State<ExplainScreen> createState() => _ExplainScreenState();
}

class _ExplainScreenState extends State<ExplainScreen> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetPaths.image.paradise), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            AppStrings.why_this_app.tr(),
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          image:
                              DecorationImage(image: AssetImage(AssetPaths.image.horror), fit: BoxFit.cover)),
                      constraints: BoxConstraints(minHeight: 100, maxHeight: 250),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      child: Text(
                        AppStrings.app_was_written_because.tr(),
                        style: TextStyle(fontSize: 20, height: 1.3),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          NavigationService.instance.pop();
                        },
                        child: Text(AppStrings.enjoy.tr(), style: TextStyle(fontSize: 20),)),
                    SizedBox(height: 24,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
