import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/data/remote/keyword/api/keyword_api_service.dart';
import 'package:huynd2_assignment/data/remote/keyword/response/keyword_response.dart';
import 'package:huynd2_assignment/data/local/keyword/datasource/keyword_db_helper.dart';
import 'package:huynd2_assignment/domain/keyword/entity/key_word_entity.dart';
import 'package:huynd2_assignment/domain/keyword/repository/key_word_repository.dart';

class KeywordRepositoryImpl implements KeyWordRepository {
  final KeywordApiService _keywordApiService;
  final KeywordDbHelper dbHelper;

  KeywordRepositoryImpl(this._keywordApiService, this.dbHelper);

  @override
  Future<PageResponse<List<KeywordResponse>>> getKeyWords(String query) {
    try {
      final httpResponse = _keywordApiService.getKeywordById(query: query);
      return httpResponse;
    } on ApiException catch (e) {
      throw ApiException(message: e.toString());
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<void> addKeyword(KeywordEntity keyword) async {
    try {
      await dbHelper.insertKeyword(keyword);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteKeyword(int id) async {
    try {
      await dbHelper.deleteKeyword(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<KeywordEntity>> getKeywords() async {
    try {
      return await dbHelper.getKeywords();
    } catch (e) {
      rethrow;
    }
  }
}
