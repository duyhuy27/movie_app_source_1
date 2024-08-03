import 'package:dio/dio.dart';
import 'package:huynd2_assignment/core/resource/api/api_endpoint.dart';
import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/data/remote/people/response/actor_response.dart';
import 'package:retrofit/retrofit.dart';

part 'people_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoint.baseApiUrl)
abstract class PeopleApiService {
  factory PeopleApiService(Dio dio, {String baseUrl}) = _PeopleApiService;

  @GET(ApiEndPoint.peopleEndPoint)
  @Extra({'requiresApiKey': true})
  Future<PageResponse<List<ActorResponse>>> getPopularPeople({
    @Query("page") int? page,
  });
}
