import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_with_clean/core/resources/color_manager.dart';
import 'package:movies_with_clean/core/resources/string_manager.dart';
import 'package:movies_with_clean/core/resources/values_manager.dart';

import '../controller/search_bloc.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _textController = TextEditingController();
  bool isClear = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      child: TextFormField(
        controller: _textController,
        cursorColor: ColorManager.white,
        cursorWidth: 1,
        onChanged: (title) {
          context.read<SearchBloc>().add(GetSearchResultEvent(title));
          isClear = true;
          setState(() {});
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: ColorManager.white,
            ),
            borderRadius: BorderRadius.circular(AppRadius.r8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color:ColorManager.white,
            ),
            borderRadius: BorderRadius.circular(AppRadius.r8),
          ),
          prefixIcon:  Icon(
            Icons.search_rounded,
            color: ColorManager.white,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              _textController.clear();
              context.read<SearchBloc>().add(const GetSearchResultEvent(''));
              setState(() {
                isClear = false;
              });
            },
            child: isClear ?  Icon(
              Icons.clear_rounded,
              color:ColorManager.white
            ):const SizedBox(),
          ),
          hintText: StringManager.search,
        ),
      ),
    );
  }
}