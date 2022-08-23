import 'package:flutter/material.dart';
import 'package:question_master/const/asset_paths.dart';

class QmScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;

  const QmScaffold({Key? key, required this.body, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(AssetPaths.image.paradise), fit: BoxFit.cover)),
        child: Scaffold(appBar: appBar, backgroundColor: Colors.transparent, body: body));
  }
}
