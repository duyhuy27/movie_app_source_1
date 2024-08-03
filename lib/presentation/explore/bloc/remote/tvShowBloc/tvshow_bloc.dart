
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/domain/tv_show/usecase/tv_show_usecase.dart';
import 'package:huynd2_assignment/manager/enum/status_enum.dart';
import 'package:huynd2_assignment/presentation/explore/bloc/remote/tvShowBloc/tvshow_event.dart';
import 'package:huynd2_assignment/presentation/explore/bloc/remote/tvShowBloc/tvshow_state.dart';

class TvshowBloc extends Bloc<TvshowEvent, TvshowState> {
  TVShowUseCase tvShowUseCase;
  TvshowBloc(this.tvShowUseCase) : super(const TvshowState()) {
    on<GetTVShowAirToDayEvent>(_getTVShowAirToday);
  }

  Future<void> _getTVShowAirToday(GetTVShowAirToDayEvent event, Emitter<TvshowState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await tvShowUseCase.getTVShowAirTodayUseCase();
      emit(state.copyWith(status: Status.success, tvShowList: response.results));
    } on ApiException catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.message));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }
}
