
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huynd2_assignment/domain/detail_people/usecase/detail_person_usecase.dart';
import 'package:huynd2_assignment/manager/enum/status_enum.dart';
import 'package:huynd2_assignment/presentation/detail_people/bloc/detail_persion/detail_person_event.dart';
import 'package:huynd2_assignment/presentation/detail_people/bloc/detail_persion/detail_person_state.dart';


class DetailPersonBloc extends Bloc<DetailPersonEvent, DetailPersonState> {
  final DetailPersonUsecase personDetailUseCase;
  DetailPersonBloc(this.personDetailUseCase) : super(const DetailPersonState()) {
    on<GetDetailOfPersonEvent>(_getDetailOfPerson);
  }


  Future<void> _getDetailOfPerson(GetDetailOfPersonEvent event, Emitter<DetailPersonState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final personDetail = await personDetailUseCase.getPersonDetail(event.personId);
      emit(state.copyWith(status: Status.success, personDetail: personDetail));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
