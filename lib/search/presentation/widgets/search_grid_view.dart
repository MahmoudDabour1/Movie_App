import 'package:flutter/material.dart';
import 'package:movies_with_clean/core/resources/values_manager.dart';
import 'package:movies_with_clean/search/domain/entities/search.dart';
import 'package:movies_with_clean/search/presentation/widgets/grid_view_card_widget.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({
    super.key,
    required this.results,
  });

  final List<Search> results;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding:   EdgeInsets.symmetric(vertical: AppPadding.p8),
        itemCount: results.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          childAspectRatio: 0.55,
        ),
        itemBuilder: (context, index) {
          return GridViewCardWidget(item: results[index]);
        },
      ),
    );
  }
}