import 'package:com_mottu_marvel/design_system/colors/ds_colors.dart';
import 'package:com_mottu_marvel/design_system/text/base_text.dart';
import 'package:com_mottu_marvel/design_system/text/text_style/sample_text_style.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final double? heigth;
  final double? width;
  final Color? backgroundColor;
  final String? description;
  final String? image;

  /// child: A widget to set an child [Widget] on the center of the card.
  /// It's recommended to use a GridView to group multiples components [children]
  const CardWidget({Key? key, this.heigth, this.width, this.backgroundColor, this.description, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        constraints: BoxConstraints(
          minHeight: heigth ?? 150.0,
          //maxHeight: constraints.maxWidth,
        ),
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: backgroundColor ?? DSColors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xffDDDDDD),
              offset: Offset(0.0, 0.0),
              spreadRadius: 2.0,
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 240,
                color: DSColors.gray,
                child: Image.network(image!),
              ),
              const SizedBox(
                height: 10,
              ),
              BaseText(description!,
                  // 'A expressão Lorem ipsum em design gráfico e editoração é um texto padrão em latim utilizado na produção gráfica para preencher os espaços de texto em publicações para testar e ajustar aspectos visuais antes de utilizar conteúdo real.',
                  sampleTextStyle: SampleTextStyle.cardDescription().getStyle()),
            ],
          ),
        ),
      );
    });
  }
}
