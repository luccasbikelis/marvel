import 'package:com_mottu_marvel/design_system/card/card_widget.dart';
import 'package:com_mottu_marvel/design_system/colors/ds_colors.dart';
import 'package:com_mottu_marvel/design_system/filter/filter_widget.dart';
import 'package:com_mottu_marvel/design_system/mottu_button/mottu_button.dart';
import 'package:com_mottu_marvel/design_system/text/base_text.dart';
import 'package:com_mottu_marvel/design_system/text/text_style/sample_text_style.dart';
import 'package:com_mottu_marvel/presenter/home/controllers/get_character_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  static const routeName = '/dashboard_view';

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final getCharacterController = GetIt.I<GetCharacterController>();
  late final SharedPreferences _sharedPreferences;
  int _itemCount = 5;
  String _searchText = '';
  @override
  void initState() {
    getCharacterController.call();

    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _sharedPreferences = prefs;
      });
    });
  }

  @override
  void dispose() {
    _sharedPreferences.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BaseText(
          'Mottu Marvel',
          sampleTextStyle: SampleTextStyle.cardTitle().getStyle(color: DSColors.black),
        ),
        backgroundColor: DSColors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: FilterWidget(
              onFilterChanged: (searchText) {
                setState(() {
                  _searchText = searchText;
                });
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: getCharacterController.marvelResponseListenable,
                builder: (context, snapshot, _) {
                  final character = snapshot;

                  if (character == null) {
                    return const SizedBox.shrink();
                  }
                  final filteredCharacters = character.listCharacters.where((c) => c.name.toLowerCase().contains(_searchText.toLowerCase())).toList();

                  return ListView.builder(
                      itemCount: _itemCount,
                      itemBuilder: (context, index) {
                        if (index >= filteredCharacters.length) {
                          return const SizedBox.shrink();
                        }

                        if (index == _itemCount - 1) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 34, bottom: 24),
                            child: MottuButton(
                              padding: const EdgeInsets.only(
                                left: 120,
                                right: 120,
                              ),
                              text: 'Mostrar mais',
                              textColor: DSColors.black,
                              onTap: () async {
                                await _showMoreItems(context);
                              },
                            ),
                          );
                        } else {
                          final fullIndex = character.listCharacters.indexOf(filteredCharacters[index]);
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CardWidget(
                              marvelResponseEntity: character,
                              index: fullIndex,
                              name: filteredCharacters[index].name,
                              image: filteredCharacters[index].thumbnailUrl,
                            ),
                          );
                        }
                      });
                }),
          ),
        ],
      ),
    );
  }

  Future<void> _showMoreItems(BuildContext context) async {
    //teste funcionalidade firebase crashlytics

    // FirebaseCrashlytics.instance.crash();
    if (_itemCount >= getCharacterController.marvelResponseListenable.value!.listCharacters.length) {
      _showErrorDialog(context);
    } else {
      setState(() {
        _itemCount += 5;
      });

      await getCharacterController.call(offset: _itemCount);
    }
  }

  Future<void> _showErrorDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro ao carregar personagens'),
          content: const Text('Ocorreu um erro ao tentar carregar mais personagens.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
