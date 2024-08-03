import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/data/remote/review/api/review_api_service.dart';
import 'package:huynd2_assignment/data/remote/review/response/review_response.dart';
import 'package:huynd2_assignment/domain/review/repository/review_repository.dart';

class ReviewRepositoryImpl extends ReviewRepository {
  final ReviewApiService _reviewApiService;

  ReviewRepositoryImpl(this._reviewApiService);

  @override
  Future<PageResponse<List<ReviewResponse>>> getReviewByMovieId(
      int movieId) async {
    try {
      final httpResponse = await _reviewApiService.getReviewByMovieId(movieId);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PageResponse<List<ReviewResponse>>> getReviewByTvShowID(
      int seriesID) async {
    try {
      final httpResponse =
          await _reviewApiService.getReviewByTvShowID(seriesID);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
