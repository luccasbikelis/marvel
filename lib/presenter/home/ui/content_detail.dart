import 'package:marvel/design_system/colors/ds_colors.dart';
import 'package:marvel/design_system/text/base_text.dart';
import 'package:marvel/design_system/text/text_style/sample_text_style.dart';
import 'package:marvel/features/home/domain/entities/marvel_response_entity.dart';
import 'package:flutter/material.dart';

class ContentDetail extends StatefulWidget {
  const ContentDetail({super.key, required this.marvelResponseEntity, required this.index});

  final MarvelResponseEntity marvelResponseEntity;
  final int index;

  static const routeName = '/content_detail';

  @override
  State<ContentDetail> createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BaseText(
          'Detalhes',
          sampleTextStyle: SampleTextStyle.cardTitle().getStyle(color: DSColors.black),
        ),
        backgroundColor: DSColors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: DSColors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              width: double.infinity,
              color: DSColors.gray,
              child: Image.network(
                widget.marvelResponseEntity.listCharacters[widget.index].thumbnailUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 16),
            //CARD NAME
            BaseText(widget.marvelResponseEntity.listCharacters[widget.index].name,
                sampleTextStyle: SampleTextStyle.cardTitle().getStyle(color: DSColors.black)),
            const SizedBox(height: 10),
            //CARD DESCRIPTION
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BaseText(widget.marvelResponseEntity.listCharacters[widget.index].description,
                  sampleTextStyle: SampleTextStyle.cardDescription().getStyle(color: DSColors.gray)),
            ),
          ],
        ),
      ),
    );
  }
}
