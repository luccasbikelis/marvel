import 'package:flutter/material.dart';
import 'package:marvel/design_system/colors/ds_colors.dart';

class FilterWidget extends StatefulWidget {
  final ValueChanged<String> onFilterChanged;

  const FilterWidget({Key? key, required this.onFilterChanged}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchTextChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    widget.onFilterChanged(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: const TextStyle(
                  color: DSColors.white,
                ),
                controller: _searchController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Pesquisar personagem...',
                    hintStyle: TextStyle(
                      color: DSColors.white,
                    )),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _searchController.clear();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
