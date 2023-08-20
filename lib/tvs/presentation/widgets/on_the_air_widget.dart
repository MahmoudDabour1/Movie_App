import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_with_clean/core/resources/color_manager.dart';
import 'package:movies_with_clean/core/utils/enums.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/string_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../controller/tv_bloc.dart';
import '../screens/tv_detail_screen.dart';

class OnAirWidget extends StatelessWidget {
  const OnAirWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) =>
          previous.onAirState != current.onAirState,
      builder: (context, state) {
        switch (state.onAirState) {
          case RequestState.loading:
            return SizedBox(
                height: 400.h,
                child: Center(
                    child: CircularProgressIndicator(
                        color: ColorManager.primary)));
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 500.0.h,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.onAirTv.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    TvDetailScreen(
                                      id: item.id,
                                    )));
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: 560.0.h,
                              width: double.infinity,
                              imageUrl: ApiConstance.imageUrl(item.posterPath),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(bottom: AppPadding.p16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.redAccent,
                                        size: AppSize.s16,
                                      ),
                                      SizedBox(width: 4.0.w),
                                      Text(
                                        StringManager.onTheAir.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: FontSize.s16,
                                          color: ColorManager.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(bottom: AppPadding.p16),
                                  child: Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: FontSize.s24,
                                      color: ColorManager.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 400.w,
              child: Center(child: Text(state.onAirMessage)),
            );
          default:
            {
              return SizedBox(
                  height: 400.h,
                  child: Center(child: CircularProgressIndicator(color: ColorManager.primary,)));
            }
        }
      },
    );
  }
}
