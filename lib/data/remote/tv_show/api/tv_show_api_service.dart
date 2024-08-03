import 'package:dio/dio.dart';
import 'package:huynd2_assignment/core/resource/api/api_endpoint.dart';
import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/data/remote/tv_show/response/tv_show_response.dart';
import 'package:retrofit/retrofit.dart';

part 'tv_show_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoint.baseApiUrl)
abstract class TVShowApiService {
  factory TVShowApiService(Dio dio) = _TVShowApiService;

  @GET(ApiEndPoint.tvAiringTodayEndPoint)
  @Extra({'requiresApiKey': true})
  Future<PageResponse<List<TVShowResponse>>> getAiringTodayTVShows({
    @Query("page") int? page,
    @Query("language") String? language,
  });

  @GET(ApiEndPoint.tvPopularEndPoint)
  @Extra({'requiresApiKey': true})
  Future<PageResponse<List<TVShowResponse>>> getPopularTVShows({
    @Query("page") int? page,
    @Query("language") String? language,
  });

  @GET(ApiEndPoint.tvSimilarEndPoint)
  @Extra({'requiresApiKey': true})
  Future<PageResponse<List<TVShowResponse>>> getSimilarTVShows({
    @Path("series_id") required String seriesID,
  });
}
