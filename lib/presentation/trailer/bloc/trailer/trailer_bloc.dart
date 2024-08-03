
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/domain/trailer/usecase/trailer_usecase.dart';
import 'package:huynd2_assignment/manager/enum/status_enum.dart';
import 'package:huynd2_assignment/presentation/trailer/bloc/trailer/trailer_event.dart';
import 'package:huynd2_assignment/presentation/trailer/bloc/trailer/trailer_state.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState> {
  TrailerUseCase trailerUseCase;

  TrailerBloc(this.trailerUseCase) : super(const TrailerState()) {
    on<GetTrailerEvent>(_onGetTrailerEvent);
    on<UpdateTrailerTypeEvent>(_onUpdateTrailerTypeEvent);
    on<UpdateControllerReadyEvent>(_onUpdateControllerReadyEvent);
  }

  Future<void> _onGetTrailerEvent(
      GetTrailerEvent event, Emitter<TrailerState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final httpResponse =
          await trailerUseCase.getTrailerByIdUseCase(event.movieId);
      emit(state.copyWith(
          status: Status.success, trailers: httpResponse.results));
    } on ApiException catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.message));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }

  void _onUpdateTrailerTypeEvent(
      UpdateTrailerTypeEvent event, Emitter<TrailerState> emit) {
    emit(state.copyWith(currentTrailerType: event.trailerType));
  }

  void _onUpdateControllerReadyEvent(
      UpdateControllerReadyEvent event, Emitter<TrailerState> emit) {
    emit(state.copyWith(isControllerReady: event.isControllerReady));
  }
}
