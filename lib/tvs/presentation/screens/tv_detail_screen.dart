import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_with_clean/core/resources/font_manager.dart';
import 'package:movies_with_clean/core/resources/string_manager.dart';
import 'package:movies_with_clean/core/resources/values_manager.dart';
import 'package:movies_with_clean/tvs/presentation/controller/tv_details_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/genres_tv.dart';

class TvDetailScreen extends StatelessWidget {
  final int id;

  const TvDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<TvDetailsBloc>()
          ..add(GetTvDetailsEvent(id))
          ..add(GetTvRecommendationEvent(id)),
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
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      builder: (context, state) {
        switch (state.tvRequestState) {
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
                              state.tvDetails!.backdropPath),
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
                          Text(state.tvDetails!.originalName,
                              style: GoogleFonts.poppins(
                                fontSize: FontSize.s23,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              )),
                          SizedBox(height: AppPadding.p8),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppPadding.p2,
                                  horizontal: AppPadding.p8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius:
                                      BorderRadius.circular(AppPadding.p4),
                                ),
                                child: Text(
                                  state.tvDetails!.firstAirDate.split('-')[0],
                                  style: TextStyle(
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.0.w),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: ColorManager.amber,
                                    size: AppSize.s20,
                                  ),
                                  SizedBox(width: 4.0.w),
                                  Text(
                                    (state.tvDetails!.voteAverage / 2)
                                        .toStringAsFixed(1),
                                    style: TextStyle(
                                      fontSize: FontSize.s16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    '(${state.tvDetails!.voteAverage})',
                                    style: const TextStyle(
                                      fontSize: 1.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16.0.w),
                              Text(
                                _showDuration(state.tvDetails!.episodeRunTime),
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
                            state.tvDetails!.overview,
                            style: TextStyle(
                              fontSize: FontSize.s16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 8.0.h),
                          Text(
                            'Genres: ${_showGenres(state.tvDetails!.genres)}',
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
                  padding: EdgeInsets.fromLTRB(AppPadding.p16, AppPadding.p16,
                      AppPadding.p16, AppPadding.p24),
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
                // Tab(text: 'More like this'.toUpperCase()),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(
                      AppPadding.p16, 0, AppPadding.p16, AppPadding.p24),
                  sliver: _showRecommendations(),
                ),
              ],
            );
          case RequestState.error:
            return Center(
              child: Text(state.tvDetailsMessage),
            );
        }
      },
    );
  }

  String _showGenres(List<GenresTv> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(List<int> runtime) {
    for (var element in runtime) {
      final int hours = element ~/ 60;
      final int minutes = element % 60;

      if (hours > 0) {
        return '${hours}h ${minutes}m';
      } else {
        return '${minutes}m';
      }
    }
    return '';
  }

  Widget _showRecommendations() {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
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
                              TvDetailScreen(id: recommendation.id)));
                },
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.r8)),
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
                            color: ColorManager.black,
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
