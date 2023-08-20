import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_with_clean/core/network/api_constance.dart';
import 'package:movies_with_clean/core/resources/values_manager.dart';
import 'package:movies_with_clean/search/domain/entities/search.dart';
import 'package:movies_with_clean/tvs/presentation/screens/tv_detail_screen.dart';

import '../../../core/components/image_with_shimmer.dart';
import '../../../movies/presentation/screens/movie_detail_screen.dart';

class GridViewCardWidget extends StatelessWidget {
  const GridViewCardWidget({super.key, required this.item});

  final Search item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            item.isMovie
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MovieDetailScreen(
                              id: item.id,
                            )))
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => TvDetailScreen(
                              id: item.id,
                            )));
          },
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.r8),
              child: ImageWithShimmer(
                imageUrl: ApiConstance.imageUrl(item.backdropPath),
                height: 150.h,
                width: double.infinity,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
