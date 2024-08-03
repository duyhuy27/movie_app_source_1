import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huynd2_assignment/core/constant/app_constant.dart';
import 'package:huynd2_assignment/di/injection.dart';
import 'package:huynd2_assignment/domain/cast/usecase/cast_usecase.dart';
import 'package:huynd2_assignment/domain/detail_movie/usecase/detail_movie_usecase.dart';
import 'package:huynd2_assignment/domain/image_movie/usecase/image_detail_usecase.dart';
// ignore: unused_import
import 'package:huynd2_assignment/domain/movie/entity/movie_entity.dart';
import 'package:huynd2_assignment/domain/movie/usecase/movie_usecase.dart';
import 'package:huynd2_assignment/domain/review/usecase/review_usecase.dart';
import 'package:huynd2_assignment/manager/enum/status_enum.dart';
import 'package:huynd2_assignment/manager/utils/utils.dart';
import 'package:huynd2_assignment/manager/widget/button_back_widget.dart';
import 'package:huynd2_assignment/manager/widget/layout_error_widget.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/cast/cast_bloc.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/cast/cast_event.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/detail_movie/detail_of_movie_bloc.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/detail_movie/detail_of_movie_event.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/detail_movie/detail_of_movie_state.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/image/image_bloc.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/image/image_event.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/review/review_bloc.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/review/review_event.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/similar_movie/similar_movie_bloc.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/similar_movie/similar_movie_event.dart';
import 'package:huynd2_assignment/presentation/detail_movie/widget/cast_section_widget.dart';
import 'package:huynd2_assignment/presentation/detail_movie/widget/detail_body_widget.dart';
import 'package:huynd2_assignment/presentation/detail_movie/widget/detail_top_widget.dart';
import 'package:huynd2_assignment/presentation/detail_movie/widget/flexiable_detail_widget.dart';
import 'package:huynd2_assignment/presentation/detail_movie/widget/review_section_widget.dart';
import 'package:huynd2_assignment/presentation/detail_movie/widget/similar_movie_section_widget.dart';
import 'package:huynd2_assignment/presentation/detail_movie/widget/title_widget.dart';
import 'package:huynd2_assignment/presentation/detail_movie/widget/title_with_see_all_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen(
      {super.key, required this.idMovie, required this.uid});

  final int idMovie;
  final String uid;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen>
    with TickerProviderStateMixin {
  final PageController pageController = PageController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User? user;

  //create getter
  String get uid => widget.uid;
  int get idMovie => widget.idMovie;

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
    // context.read<DetailOfMovieBloc>().add(
    //       GetDetailOfMovieEvent(movieId: idMovie),
    //     );
    // context.read<CastBloc>().add(GetCastDetailOfMovieEvent(id: idMovie));
    // context.read<ReviewBloc>().add(GetReviewEvent(idMovie));
    // context.read<SimilarMovieBloc>().add(GetSimilarMovieListEvent(id: idMovie));
    // context.read<ImageBloc>().add(GetImageEvent(id: idMovie));
  }

  void reloadScreen() {
    context.read<DetailOfMovieBloc>().add(
          GetDetailOfMovieEvent(movieId: idMovie),
        );
    context.read<CastBloc>().add(GetCastDetailOfMovieEvent(id: idMovie));
    context.read<ReviewBloc>().add(GetReviewEvent(idMovie));
    context.read<SimilarMovieBloc>().add(GetSimilarMovieListEvent(id: idMovie));
    context.read<ImageBloc>().add(GetImageEvent(id: idMovie));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => DetailOfMovieBloc(sl<DetailMovieUseCase>())
                ..add(GetDetailOfMovieEvent(movieId: idMovie))),
          BlocProvider(
              create: (context) => CastBloc(sl<CastUseCase>())
                ..add(GetCastDetailOfMovieEvent(id: idMovie))),
          BlocProvider(
              create: (context) => ReviewBloc(sl<ReviewUseCase>())
                ..add(GetReviewEvent(idMovie))),
          BlocProvider(
              create: (context) => SimilarMovieBloc(sl<MovieUseCase>())
                ..add(GetSimilarMovieListEvent(id: idMovie))),
          BlocProvider(
              create: (context) => ImageBloc(sl<ImageDetailUseCase>())
                ..add(GetImageEvent(id: idMovie))),
        ],
        child: BlocBuilder<DetailOfMovieBloc, DetailOfMovieState>(
          builder: (context, state) {
            if (state.status == Status.failure) {
              return ErrorLayoutWidget(
                tap: () {
                  context.read<DetailOfMovieBloc>().add(
                        GetDetailOfMovieEvent(movieId: idMovie),
                      );
                  context
                      .read<CastBloc>()
                      .add(GetCastDetailOfMovieEvent(id: idMovie));
                  context.read<ReviewBloc>().add(GetReviewEvent(idMovie));
                  context
                      .read<SimilarMovieBloc>()
                      .add(GetSimilarMovieListEvent(id: idMovie));
                  context.read<ImageBloc>().add(GetImageEvent(id: idMovie));
                },
                message: 'Oops! Something went wrong !!',
              );
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: const ButtonBackWidget(),
                  expandedHeight: AppConstant.defaultExpandedHeight.h,
                  pinned: false,
                  flexibleSpace: FlexibleDetailMovieWidget(
                    pageController: pageController,
                    onTap: () {
                      reloadScreen();
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        10.verticalSpace,
                        DetailTopWidget(
                          uid: uid,
                          user: user!,
                          idMovie: idMovie,
                        ),
                        16.verticalSpace,
                        TitleWidget(
                          title: 'cast_crew'.tr(),
                        ),
                        16.verticalSpace,
                        const CastSectionWidget(),
                        const DetailBodyWidget(),
                        20.verticalSpace,
                        TitleWithSeeAllWidget(
                          callback: () {
                            AppUtils.showBottomDialogToShowAllReview(
                                context: context, id: idMovie);
                          },
                          title: 'reviews'.tr(),
                          seeAll: 'all_reviews'.tr(),
                        ),
                        16.verticalSpace,
                        const ReviewsSectionWidget(),
                        20.verticalSpace,
                        TitleWithSeeAllWidget(
                          callback: () {},
                          title: 'similar'.tr(),
                          seeAll: '',
                        ),
                        16.verticalSpace,
                        SimilarMovieSectionWidget(
                            widget: widget, uid: uid, idMovie: idMovie),
                        36.verticalSpace,
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
