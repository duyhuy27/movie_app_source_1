import 'package:dio/dio.dart';
import 'package:huynd2_assignment/core/resource/api/api_endpoint.dart';
import 'package:huynd2_assignment/data/remote/detail_movie/response/movie_detail_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_detail_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoint.baseApiUrl)
abstract class MovieDetailApiService {
  factory MovieDetailApiService(Dio dio, {String baseUrl}) = _MovieDetailApiService;

  @GET(ApiEndPoint.movieDetailEndPoint)
  @Extra({'requiresApiKey': true})
  Future<MovieDetailResponse> getMovieDetail(@Path('movie_id') int movieId);
}
