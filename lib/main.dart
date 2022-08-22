import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:question_master/const/app_constants.dart';
import 'package:question_master/const/sizes.dart';
import 'package:question_master/core/services/custom_router.dart';
import 'package:question_master/core/services/navigation_service.dart';
import 'package:question_master/ui/screens/question_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  await EasyLocalization.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppConstants.locale.supportedLocales,
      path: AppConstants.locale.localesPath,
      fallbackLocale: AppConstants.locale.fallbackLocale,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Question master',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            builder: (context, child){
              return child!;
            },
            onGenerateRoute: CustomRouter.generateRoute,
            navigatorKey: NavigationService.instance.navigatorKey,
            home: Builder(
              builder: (context) {
                SizeConfig.init(context);
                return const QuestionScreen();
              }
            ),
          );
        }
      ),
    );
  }
}
