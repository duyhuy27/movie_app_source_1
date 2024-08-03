
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/domain/detail_movie/usecase/detail_movie_usecase.dart';
import 'package:huynd2_assignment/manager/enum/status_enum.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/detail_movie/detail_of_movie_event.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/detail_movie/detail_of_movie_state.dart';

class DetailOfMovieBloc extends Bloc<DetailOfMovieEvent, DetailOfMovieState> {
  DetailMovieUseCase detailMovieUseCase;
  DetailOfMovieBloc(this.detailMovieUseCase) : super(const DetailOfMovieState()) {
    on<GetDetailOfMovieEvent>(_getDetailOfMovie);
  }

  Future<void> _getDetailOfMovie(
    GetDetailOfMovieEvent event,
    Emitter<DetailOfMovieState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await detailMovieUseCase.getDetailOfMovieDefaultUseCase(event.movieId);
      emit(state.copyWith(status: Status.success, movieDetail: response));
    } on ApiException catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.message));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }
}
