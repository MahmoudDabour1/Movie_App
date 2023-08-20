import 'package:flutter/material.dart';

import '../../../core/resources/string_manager.dart';

class NoResults extends StatelessWidget {
  const NoResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(
          StringManager.noResultsFound,
        ),
      ),
    );
  }
}
