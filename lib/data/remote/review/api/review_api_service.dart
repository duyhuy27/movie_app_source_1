import 'package:dio/dio.dart';
import 'package:huynd2_assignment/core/resource/api/api_endpoint.dart';
import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/data/remote/review/response/review_response.dart';
import 'package:retrofit/retrofit.dart';

part 'review_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoint.baseApiUrl)
abstract class ReviewApiService {
  factory ReviewApiService(Dio dio) = _ReviewApiService;

  @GET(ApiEndPoint.reviewEndPoint)
  @Extra({'requiresApiKey': true})
  Future<PageResponse<List<ReviewResponse>>> getReviewByMovieId(@Path("movie_id") int movieId);

  @GET(ApiEndPoint.reviewTvEndPoint)
  @Extra({'requiresApiKey': true})
  Future<PageResponse<List<ReviewResponse>>> getReviewByTvShowID(@Path("series_id") int seriesID);
}
