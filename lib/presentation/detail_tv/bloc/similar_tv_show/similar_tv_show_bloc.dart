

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huynd2_assignment/domain/tv_show/usecase/tv_show_usecase.dart';
import 'package:huynd2_assignment/manager/enum/status_enum.dart';
import 'package:huynd2_assignment/presentation/detail_tv/bloc/similar_tv_show/similar_tv_show_event.dart';
import 'package:huynd2_assignment/presentation/detail_tv/bloc/similar_tv_show/similar_tv_show_state.dart';

class SimilarTvShowBloc extends Bloc<SimilarTvShowEvent, SimilarTvShowState> {
  final TVShowUseCase _tvShowUseCase;
  SimilarTvShowBloc(this._tvShowUseCase) : super(const SimilarTvShowState()) {
    on<GetSimilarTVEvent>(_getTVShowSimilar);
  }

  Future<void> _getTVShowSimilar(GetSimilarTVEvent event, Emitter<SimilarTvShowState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await _tvShowUseCase.getTVShowSimilarUseCase(event.seriesID);
      emit(state.copyWith(status: Status.success, tvShows: response.results));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
