import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/data/remote/search/api/search_api_service.dart';
import 'package:huynd2_assignment/domain/movie/entity/movie_entity.dart';
import 'package:huynd2_assignment/domain/search/repository/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchApiService searchApiService;

  SearchRepositoryImpl(this.searchApiService);
  @override
  Future<PageResponse<List<MovieEntity>>> searchMovie(String query) {
    try {
      final httpResponse = searchApiService.searchMovie(query: query);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PageResponse<List<MovieEntity>>> searchMovieByFilter(
      String query, bool isAdult, String primaryReleaseYear, String region) {
    try {
      final httpResponse = searchApiService.searchMovieByFilter(
          query: query,
          page: 1,
          isAdult: isAdult,
          primaryReleaseYear: primaryReleaseYear,
          region: region);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
