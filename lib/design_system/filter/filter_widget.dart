import 'package:com_mottu_marvel/design_system/colors/ds_colors.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: DSColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xffDDDDDD),
            offset: Offset(0.0, 0.0),
            spreadRadius: 2.0,
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children:  [
          const SizedBox(
            width: 10,
          ),
         const Icon(Icons.search, size: 18),
         const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration:const InputDecoration(
                hintText: 'Pesquisar',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
