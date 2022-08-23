import 'package:flutter/material.dart';

class CardTileWrapper extends StatelessWidget {
  final Widget child;
  const CardTileWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
    child: child));
  }
}
