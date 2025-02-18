import 'package:dio/dio.dart';
import 'package:huynd2_assignment/core/resource/api/api_endpoint.dart';
import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/data/remote/movie/response/movie_response.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoint.baseApiUrl)
abstract class SearchApiService {
  factory SearchApiService(Dio dio, {String baseUrl}) = _SearchApiService;

  @GET(ApiEndPoint.searchMovieEndPoint)
  @Extra({'requiresApiKey': true})
  Future<PageResponse<List<MovieResponse>>> searchMovie({
    @Query("query") String? query,
    @Query("page") int? page,
  });

  @GET(ApiEndPoint.searchMovieEndPoint)
  @Extra({'requiresApiKey': true})
  Future<PageResponse<List<MovieResponse>>> searchMovieByFilter({
    @Query("query") String? query,
    @Query("page") int? page,
    @Query("include_adult") bool? isAdult,
    @Query("primary_release_year") String? primaryReleaseYear,
    @Query("region") String? region,
  });
}
