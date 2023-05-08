import 'package:com_mottu_marvel/app/app.dart';
import 'package:com_mottu_marvel/app/components/loading_overlay.dart';
import 'package:com_mottu_marvel/design_system/card/card_widget.dart';
import 'package:com_mottu_marvel/design_system/colors/ds_colors.dart';
import 'package:com_mottu_marvel/design_system/filter/filter_widget.dart';
import 'package:com_mottu_marvel/design_system/text/base_text.dart';
import 'package:com_mottu_marvel/features/home/domain/entities/character.dart';
import 'package:com_mottu_marvel/presenter/home/controllers/get_character.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final getCharacterController = GetIt.I<GetCharacterController>();

  @override
  void initState() {
    getCharacterController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BaseText('Mottu Marvel'),
        backgroundColor: DSColors.green,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: FilterWidget(),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: getCharacterController.marvelResponseListenable,
                builder: (context, snapshot, _) {
                  // TODO: CHAMADA FUNCIONOU, PORÉM PRECISA ATUALIZAR O OBJETO!!!
                  final character = snapshot;
                  // thumbnailUrl: 'thumbnailUrl'
                  if (character == null) {
                    return const SizedBox.shrink();
                  }
                  return ListView.builder(
                      itemCount: character.listCharacters.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CardWidget(
                            image: character.listCharacters[index].thumbnailUrl,
                            description: character.listCharacters[index].name,
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
