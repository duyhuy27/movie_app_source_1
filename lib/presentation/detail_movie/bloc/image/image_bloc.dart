
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/domain/image_movie/usecase/image_detail_usecase.dart';
import 'package:huynd2_assignment/manager/enum/status_enum.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/image/image_event.dart';
import 'package:huynd2_assignment/presentation/detail_movie/bloc/image/image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageDetailUseCase imageDetailUseCase;
  ImageBloc(this.imageDetailUseCase) : super(const ImageState()) {
    on<GetImageEvent>(_getImageEvent);
  }

  Future<void> _getImageEvent(GetImageEvent event, Emitter<ImageState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await imageDetailUseCase.getImageDetailOfMovieUseCase(event.id);
      emit(state.copyWith(status: Status.success, imageList: response.backdrops));
    } on ApiException catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
