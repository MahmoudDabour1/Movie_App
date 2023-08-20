import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_with_clean/core/resources/color_manager.dart';
import 'package:movies_with_clean/core/resources/font_manager.dart';
import 'package:movies_with_clean/core/resources/string_manager.dart';
import 'package:movies_with_clean/core/resources/values_manager.dart';
import 'package:movies_with_clean/tvs/presentation/controller/tv_bloc.dart';
import 'package:movies_with_clean/tvs/presentation/widgets/on_the_air_widget.dart';
import 'package:movies_with_clean/tvs/presentation/widgets/popular_widget.dart';
import '../../../core/services/services_locator.dart';
import '../widgets/top_rated_widget.dart';


class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvBloc>()
        ..add(GetOnAirTvEvent())
        ..add(GetPopularTvEvent())
        ..add(GetTopRatedTvEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OnAirWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0).w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.popular,
                      style: GoogleFonts.poppins(
                        fontSize: FontSize.s18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: ColorManager.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                      },
                      child:  Padding(
                        padding: EdgeInsets.all(AppPadding.p8),
                        child: Row(
                          children: [
                            Text(
                              StringManager.seeMore,
                              style: TextStyle(
                                color: ColorManager.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: FontSize.s16,
                              color: ColorManager.white
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularTvWidget(),
              Container(
                margin:  EdgeInsets.fromLTRB(
                  AppPadding.p16,
                  AppPadding.p24,
                  AppPadding.p16,
                  AppPadding.p8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.topRated,
                      style: GoogleFonts.poppins(
                        fontSize: FontSize.s18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: ColorManager.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child:  Padding(
                        padding: EdgeInsets.all(AppPadding.p8),
                        child: Row(
                          children: [
                            Text(
                              StringManager.seeMore,
                              style: TextStyle(
                                color: ColorManager.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: AppSize.s16,
                              color: ColorManager.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedTvWidget(),
               SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
