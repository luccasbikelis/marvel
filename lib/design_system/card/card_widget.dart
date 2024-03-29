import 'package:marvel/design_system/colors/ds_colors.dart';
import 'package:marvel/design_system/text/base_text.dart';
import 'package:marvel/design_system/text/text_style/sample_text_style.dart';
import 'package:marvel/features/home/domain/entities/marvel_arguments.dart';
import 'package:marvel/features/home/domain/entities/marvel_response_entity.dart';
import 'package:marvel/presenter/home/ui/content_detail.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final double? heigth;
  final double? width;
  final Color? backgroundColor;
  final String? name;
  final String? image;

  const CardWidget(
      {Key? key, this.heigth, this.width, this.backgroundColor, this.name, this.image, required this.marvelResponseEntity, required this.index})
      : super(key: key);

  final MarvelResponseEntity marvelResponseEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onTap: () {
          _showNewsDetail(context, marvelResponseEntity, index);
        },
        child: Container(
          constraints: BoxConstraints(
            minHeight: heigth ?? 150.0,
          ),
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: backgroundColor ?? Colors.red,
            boxShadow: const [
              BoxShadow(
                color: Color(0xffDDDDDD),
                offset: Offset(0.0, 0.0),
                spreadRadius: 2.0,
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 240,
                color: DSColors.gray,
                child: Image.network(
                  image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BaseText(name!, sampleTextStyle: SampleTextStyle.cardDescription().getStyle(color: DSColors.white)),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
    });
  }

  void _showNewsDetail(
    BuildContext context,
    MarvelResponseEntity marvelResponseEntity,
    int index,
  ) {
    Navigator.of(context).pushNamed(
      ContentDetail.routeName,
      arguments: MarvelArguments(marvelResponseEntity, index),
    );
  }
}
