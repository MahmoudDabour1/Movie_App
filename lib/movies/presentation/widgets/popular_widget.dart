import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_with_clean/core/resources/values_manager.dart';
import 'package:movies_with_clean/movies/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constance.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/utils/enums.dart';
import '../controller/movies_bloc.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.loading:
            return SizedBox(
              height: 170.h,
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: EdgeInsets.only(right: AppPadding.p8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MovieDetailScreen(id: movie.id)));
                        },
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(AppRadius.r8)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0.h,
                                width: 120.0.w,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r8),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 170.h,
              child: Text(state.popularMessage),
            );
        }
      },
    );
  }
}
