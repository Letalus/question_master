import 'package:flutter/material.dart';
import 'package:question_master/const/sizes.dart';

class CardTile extends StatelessWidget {
  const CardTile({Key? key, required this.assetImage, required this.text, this.belowTextWidget}) : super(key: key);

  final String assetImage;
  final String text;
  final List<Widget>? belowTextWidget;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.tile.margin),
        child: Card(
          elevation: SizeConfig.tile.elevation,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.tile.borderRadius)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(SizeConfig.tile.borderRadius)),
                    image: DecorationImage(
                        image: AssetImage(assetImage), fit: BoxFit.cover)),
                constraints: const BoxConstraints(minHeight: 100, maxHeight: 250),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.3),
                ),
              ),
              if(belowTextWidget!=null)...belowTextWidget!,
            ],
          ),
        ),
      ),
    );
  }
}
