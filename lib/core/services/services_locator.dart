import 'package:get_it/get_it.dart';
import 'package:movies_with_clean/bottom_bar/bottom_bar_bloc.dart';
import 'package:movies_with_clean/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_with_clean/movies/data/repositories/movies_repository.dart';
import 'package:movies_with_clean/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movies_with_clean/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movies_with_clean/movies/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movies_with_clean/movies/domain/use_cases/get_top_rated_movies_usecase.dart';
import 'package:movies_with_clean/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_with_clean/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_with_clean/search/data/data_sources/search_remote_data_source.dart';
import 'package:movies_with_clean/search/data/repositories/search_repository.dart';
import 'package:movies_with_clean/search/domain/repositories/base_search_repository.dart';
import 'package:movies_with_clean/search/domain/use_cases/search_usecase.dart';
import 'package:movies_with_clean/search/presentation/controller/search_bloc.dart';
import 'package:movies_with_clean/tvs/data/data_sources/tv_remote_data_source.dart';
import 'package:movies_with_clean/tvs/data/repositories/tv_repository.dart';
import 'package:movies_with_clean/tvs/domain/repositories/base_tv_repository.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_on_air_usecase.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_popular_tv_usecase.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_recommendation_usecase.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_top_rated_tv_usecase.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_tv_details_usecase.dart';
import 'package:movies_with_clean/tvs/presentation/controller/tv_bloc.dart';
import 'package:movies_with_clean/tvs/presentation/controller/tv_details_bloc.dart';

import '../../movies/domain/repositories/base_movies_repository.dart';
import '../../movies/domain/use_cases/get_recommendation_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    sl.registerFactory(() => TvBloc(sl(), sl(), sl()));
    sl.registerFactory(() => TvDetailsBloc(sl(), sl()));
    sl.registerFactory(() => SearchBloc(sl()));
    sl.registerFactory(() => BottomBarBloc());

    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    sl.registerLazySingleton(() => GetOnAirTvUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTvUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedTvUseCase(sl()));
    sl.registerLazySingleton(() => GetTvDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetTvRecommendationUseCase(sl()));

    sl.registerLazySingleton(() => GetSearchUseCase(sl()));

    //Movies
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    //Tv
    sl.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());

    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));

    //search
    sl.registerLazySingleton<BaseSearchRepository>(
        () => SearchRepository(sl()));

    sl.registerLazySingleton<BaseSearchRemoteDataSource>(
        () => SearchRemoteDataSource());
  }
}
