import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:question_master/const/sizes.dart';
import 'package:question_master/ui/screens/first_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Question master',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child){
        return child!;
      },
      home: Builder(
        builder: (context) {
          SizeConfig.init(context);
          return const FirstScreen();
        }
      ),
    );
  }
}
