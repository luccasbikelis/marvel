import 'package:com_mottu_marvel/design_system/colors/ds_colors.dart';
import 'package:com_mottu_marvel/design_system/text/base_text.dart';
import 'package:com_mottu_marvel/design_system/text/text_style/sample_text_style.dart';
import 'package:flutter/material.dart';

class MottuButton extends StatefulWidget {
  const MottuButton(
      {Key? key,
      this.padding,
      this.width,
      this.height,
      this.onTap,
      this.enable = true,
      this.text,
      this.color = Colors.red,
      this.textColor = DSColors.black,
      this.image,
      this.paddingImage,
      this.enableBorder = false,
      this.baseText})
      : super(key: key);
  final double? width;
  final double? height;
  final String? text;
  final Color color;
  final Color? textColor;
  final BaseText? baseText;
  final VoidCallback? onTap;
  final bool enable;
  final bool enableBorder;
  final EdgeInsetsGeometry? padding;
  final Image? image;

  final EdgeInsetsGeometry? paddingImage;

  @override
  State<MottuButton> createState() => _MottuButtonState();
}

class _MottuButtonState extends State<MottuButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding ?? const EdgeInsets.all(0),
        child: GestureDetector(
          onTap: widget.enable ? widget.onTap : null,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: widget.height ?? 34,
            width: widget.width ?? double.infinity,
            decoration: getDecoration(),
            child: getButton(),
          ),
        ));
  }

  getButton() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: widget.paddingImage ?? const EdgeInsets.all(0),
            child: widget.image ?? const SizedBox(),
          ),
          getText(),
        ],
      ),
    );
  }

  getText() {
    if (widget.text == null) {
      return const SizedBox();
    }
    return widget.baseText ??
        BaseText(widget.text!,
            // 'A expressão Lorem ipsum em design gráfico e editoração é um texto padrão em latim utilizado na produção gráfica para preencher os espaços de texto em publicações para testar e ajustar aspectos visuais antes de utilizar conteúdo real.',
            sampleTextStyle: SampleTextStyle.buttonTitle().getStyle(color: DSColors.black));
  }

  getDecoration() {
    return BoxDecoration(color: widget.color, border: widget.enableBorder ? Border.all(color: DSColors.black) : null);
  }
}
