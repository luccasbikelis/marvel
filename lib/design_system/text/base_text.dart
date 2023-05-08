//Widget texto base para utilizar nas classes de texto utilizando o extends.
import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final TextStyle? sampleTextStyle;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const BaseText(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.sampleTextStyle,
    this.maxLines,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: sampleTextStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      
    );
  }
}
