import 'package:flutter/material.dart';

class QmLoadingIndicator extends StatelessWidget {
  const QmLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
