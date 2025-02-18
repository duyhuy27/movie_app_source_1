import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/domain/tv_show_detail/usecase/tv_detail_usecase.dart';
import 'package:huynd2_assignment/manager/enum/status_enum.dart';
import 'package:huynd2_assignment/presentation/detail_tv/bloc/detail_tv/detail_tv_event.dart';
import 'package:huynd2_assignment/presentation/detail_tv/bloc/detail_tv/detail_tv_state.dart';

class DetailTvBloc extends Bloc<DetailTvEvent, DetailTvState> {
  final TVDetailUseCase _tvDetailUseCase;
  DetailTvBloc(this._tvDetailUseCase) : super(const DetailTvState()) {
    on<GetDetailTvEvent>(_getDetailTv);
  }

  Future<void> _getDetailTv(
      GetDetailTvEvent event, Emitter<DetailTvState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final tvDetail = await _tvDetailUseCase.getTVShowDetail(event.id);
      emit(state.copyWith(status: Status.success, tvDetailEntity: tvDetail));
    } on ApiException catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
