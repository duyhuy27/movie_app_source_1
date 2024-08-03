import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/domain/review/entity/review_entity.dart';
import 'package:huynd2_assignment/domain/review/repository/review_repository.dart';

class ReviewUseCase {
  final ReviewRepository _reviewRepository;

  ReviewUseCase(this._reviewRepository);

  Future<PageResponse<List<ReviewEntity>>> getReviewByIdUseCase(int id) async {
    try {
      return await _reviewRepository.getReviewByMovieId(id);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future<PageResponse<List<ReviewEntity>>> getReviewByTvShowIdUseCase(int id) async {
    try {
      return await _reviewRepository.getReviewByTvShowID(id);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
