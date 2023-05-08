//Acaso queira um style diferente, criar uma nova factory e criar uma classe para o respectivo texto na pasta "text" seguindo o exemplo das demais.

import 'package:com_mottu_marvel/design_system/colors/ds_colors.dart';
import 'package:com_mottu_marvel/design_system/text/text_style/typography/font.weigth.dart' as sample_font_weight;
import 'package:com_mottu_marvel/design_system/text/text_style/typography/font_family.dart';
import 'package:com_mottu_marvel/design_system/text/text_style/typography/font_size.dart';

import 'package:flutter/material.dart';

class SampleTextStyle {
  final String fontFamily;
  final FontWeight fontWeight;
  final Color? color;
  final double fontSize;
  final double? fontHeight;
  final int? maxLines;

  const SampleTextStyle({required this.fontFamily, required this.fontWeight, this.color, this.fontHeight, required this.fontSize, this.maxLines});

  TextStyle getStyle({Color? color}) {
    return TextStyle(
      height: fontHeight,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color ?? DSColors.gray,
    );
  }

  factory SampleTextStyle.cardTitle() => SampleTextStyle(
        fontFamily: FontFamily().roboto,
        fontWeight: sample_font_weight.FontWeight().fontWeightRegular,
        fontSize: FontSize().fontSizeHeading14,
      );

  factory SampleTextStyle.cardDescription() => SampleTextStyle(
        fontFamily: FontFamily().roboto,
        fontWeight: sample_font_weight.FontWeight().fontWeightBold,
        fontSize: FontSize().fontSizeHeading16,
      );
}
