import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/domain/keyword/entity/key_word_entity.dart';
import 'package:huynd2_assignment/domain/keyword/repository/key_word_repository.dart';

class KeywordRemoteUseCase {
  final KeyWordRepository _keywordRepository;

  KeywordRemoteUseCase(this._keywordRepository);

  Future<PageResponse<List<KeywordEntity>>> getKeywordRemoteUseCase(String query) async {
    try {
      return await _keywordRepository.getKeyWords(query);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
