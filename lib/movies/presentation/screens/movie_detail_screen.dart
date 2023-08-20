import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_with_clean/core/resources/string_manager.dart';
import 'package:movies_with_clean/core/resources/values_manager.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constance.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/generes.dart';
import '../controller/movie_details_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<MovieDetailsBloc>()
          ..add(GetMovieDetailsEvent(id))
          ..add(GetMovieRecommendationEvent(id)),
        child: const MovieDetailContent(),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return Center(
              child: CircularProgressIndicator(color: ColorManager.primary),
            );
          case RequestState.loaded:
            return CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0.h,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: ApiConstance.imageUrl(
                              state.movieDetail!.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: EdgeInsets.all(AppPadding.p16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.movieDetail!.title,
                              style: GoogleFonts.poppins(
                                fontSize: FontSize.s23,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              )),
                          SizedBox(height: 8.0.h),
                          Row(
                            children: [
                              Container(
                                padding:  EdgeInsets.symmetric(
                                  vertical: AppPadding.p2,
                                  horizontal: AppPadding.p8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r8),
                                ),
                                child: Text(
                                  state.movieDetail!.releaseDate.split('-')[0],
                                  style: TextStyle(
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.0.h),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: AppSize.s16),
                                  SizedBox(width: 4.0.w),
                                  Text(
                                    (state.movieDetail!.voteAverage / 2)
                                        .toStringAsFixed(1),
                                    style: TextStyle(
                                      fontSize: FontSize.s16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '(${state.movieDetail!.voteAverage})',
                                    style: TextStyle(
                                      fontSize: FontSize.s1,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16.0.w),
                              Text(
                                _showDuration(state.movieDetail!.runtime),
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: FontSize.s16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0.h),
                          Text(
                            state.movieDetail!.overview,
                            style: TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 8.0.h),
                          Text(
                            '${StringManager.genres} ${_showGenres(state.movieDetail!.genres)}',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: FontSize.s16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        StringManager.moreLikeThis.toUpperCase(),
                        style: TextStyle(
                          fontSize: FontSize.s16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: _showRecommendations(),
                ),
              ],
            );
          case RequestState.error:
            return Center(
              child: Text(state.movieDetailsMessage),
            );
        }
      },
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  Widget _showRecommendations() {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final recommendation = state.recommendation[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MovieDetailScreen(id: recommendation.id)));
                },
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: ClipRRect(
                    borderRadius:  BorderRadius.all(Radius.circular(AppRadius.r4)),
                    child: CachedNetworkImage(
                      imageUrl:
                          ApiConstance.imageUrl(recommendation.backdropPath),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 170.0.h,
                          width: 120.0.w,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(AppRadius.r8),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      height: 180.0.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            childCount: state.recommendation.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.7,
            crossAxisCount: 3,
          ),
        );
      },
    );
  }
}
