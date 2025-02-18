
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/domain/keyword/usecase/remote/keyword_remote_usecase.dart';
import 'package:huynd2_assignment/manager/enum/status_enum.dart';
import 'package:huynd2_assignment/presentation/explore/bloc/remote/keywordBloc/keyword_event.dart';
import 'package:huynd2_assignment/presentation/explore/bloc/remote/keywordBloc/keyword_state.dart';
import 'package:rxdart/rxdart.dart';

class KeywordBloc extends Bloc<KeywordEvent, KeywordState> {
  KeywordRemoteUseCase keywordRemoteUseCase;
  KeywordBloc(this.keywordRemoteUseCase) : super(const KeywordState()) {
    on<GetKeywordBySearchEvent>(_getKeywordBySearch,
        transformer: debounce(const Duration(milliseconds: 1000)));
    on<ClearKeywordSearchEvent>(_clearKeywordEvent);
  }

  Future<void> _clearKeywordEvent(ClearKeywordSearchEvent event, Emitter<KeywordState> emit) async {
    emit(state.copyWith(listKeyword: [], status: Status.initial));
  }

  EventTransformer<Event> debounce<Event>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).switchMap(mapper);

  Future<void> _getKeywordBySearch(
      GetKeywordBySearchEvent event, Emitter<KeywordState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await keywordRemoteUseCase.getKeywordRemoteUseCase(event.query);
      emit(state.copyWith(status: Status.success, listKeyword: response.results));
    } on ApiException catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
