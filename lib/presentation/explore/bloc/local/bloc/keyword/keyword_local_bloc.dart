import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huynd2_assignment/domain/keyword/entity/key_word_entity.dart';
import 'package:huynd2_assignment/domain/keyword/usecase/local/keyword_local_usecase.dart';
import 'package:huynd2_assignment/manager/enum/status_enum.dart';
import 'package:huynd2_assignment/presentation/explore/bloc/local/bloc/keyword/keyword_local_event.dart';
import 'package:huynd2_assignment/presentation/explore/bloc/local/bloc/keyword/keyword_local_state.dart';

class KeywordLocalBloc extends Bloc<KeywordLocalEvent, KeywordLocalState> {
  final KeyWordLocalUseCase _keyWordLocalUseCase;
  KeywordLocalBloc(
    this._keyWordLocalUseCase,
  ) : super(const KeywordLocalState()) {
    on<AddKeywordEvent>(_onAddKeywordEvent);
    on<GetStoredKeywordsEvent>(_onGetStoredKeywordsEvent);
    on<RemoveKeywordEvent>(_removeKeywordEvent);
  }

  Future<void> _onAddKeywordEvent(AddKeywordEvent event, Emitter<KeywordLocalState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _keyWordLocalUseCase.addKeywordUseCase(KeywordEntity(name: event.keyword));
      add(GetStoredKeywordsEvent());
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }

  Future<void> _onGetStoredKeywordsEvent(
      GetStoredKeywordsEvent event, Emitter<KeywordLocalState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await _keyWordLocalUseCase.getKeywordsLocalUseCase();
      emit(state.copyWith(status: Status.success, listKeyword: response));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }

  Future<void> _removeKeywordEvent(
      RemoveKeywordEvent event, Emitter<KeywordLocalState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _keyWordLocalUseCase.deleteKeywordUseCase(event.idKeyword);
      add(GetStoredKeywordsEvent());
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
