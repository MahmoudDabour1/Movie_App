import 'package:flutter/material.dart';
import 'package:movies_with_clean/core/resources/values_manager.dart';

import '../../../core/resources/string_manager.dart';


class SearchText extends StatelessWidget {
  const SearchText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            StringManager.search,
          ),
          Padding(
            padding: EdgeInsets.only(top: AppPadding.p6),
            child: const Text(
              StringManager.byTyping,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}