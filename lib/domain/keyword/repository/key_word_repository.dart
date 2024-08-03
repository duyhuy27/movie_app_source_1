import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/domain/keyword/entity/key_word_entity.dart';

abstract class KeyWordRepository {
  Future<PageResponse<List<KeywordEntity>>> getKeyWords(String query);

  Future<void> addKeyword(KeywordEntity keyword);
  Future<List<KeywordEntity>> getKeywords();
  Future<void> deleteKeyword(int id);
}
