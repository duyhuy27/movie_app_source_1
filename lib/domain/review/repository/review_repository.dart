import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/domain/review/entity/review_entity.dart';

abstract class ReviewRepository {
  // API method
  Future<PageResponse<List<ReviewEntity>>> getReviewByMovieId(int movieId);
  Future<PageResponse<List<ReviewEntity>>> getReviewByTvShowID(int seriesID);
}
