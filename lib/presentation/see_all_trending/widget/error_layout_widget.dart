import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huynd2_assignment/manager/widget/layout_error_widget.dart';
import 'package:huynd2_assignment/presentation/home/bloc/genres/genres_bloc.dart';
import 'package:huynd2_assignment/presentation/home/bloc/genres/genres_event.dart';
import 'package:huynd2_assignment/presentation/see_all_trending/bloc/trending_movie/trending_movie_bloc.dart';
import 'package:huynd2_assignment/presentation/see_all_trending/bloc/trending_movie/trending_movie_event.dart';

class BuildErrorLayoutWidget extends StatelessWidget {
  const BuildErrorLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorLayoutWidget(
        tap: () {
          context
              .read<TrendingMovieBloc>()
              .add(const GetTrendingMoviesEvent(isRefresh: false));
          context.read<GenresBloc>().add(const GetGenres());
        },
        message: 'Oops! Something went wrong. Please try again!',
      ),
    );
  }
}