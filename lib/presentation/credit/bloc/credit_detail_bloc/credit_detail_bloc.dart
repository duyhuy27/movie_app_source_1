
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/domain/creadit/usecase/credit_usecase.dart';
import 'package:huynd2_assignment/manager/enum/status_enum.dart';
import 'package:huynd2_assignment/presentation/credit/bloc/credit_detail_bloc/credit_detail_event.dart';
import 'package:huynd2_assignment/presentation/credit/bloc/credit_detail_bloc/credit_detail_state.dart';

class CreditDetailBloc extends Bloc<CreditDetailEvent, CreditDetailState> {
  CreditUseCase creditUseCase;
  CreditDetailBloc(this.creditUseCase) : super(const CreditDetailState()) {
    on<GetDetailCreditEvent>(_getDetailCredit);
  }

  Future<void> _getDetailCredit(GetDetailCreditEvent event, Emitter<CreditDetailState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final creditEntity = await creditUseCase.getDetailCreditUseCase(event.id);
      emit(state.copyWith(status: Status.success, creditEntity: creditEntity));
    } on ApiException catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }
}
