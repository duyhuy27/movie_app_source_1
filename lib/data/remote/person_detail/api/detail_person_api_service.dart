

import 'package:huynd2_assignment/core/resource/api/api_endpoint.dart';
import 'package:huynd2_assignment/data/remote/person_detail/response/detail_person_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'detail_person_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoint.baseApiUrl)
abstract class DetailPersonApiService{
    factory DetailPersonApiService(Dio dio) = _DetailPersonApiService;

  @GET(ApiEndPoint.peopleDetailEndPoint)
  @Extra({'requiresApiKey': true})
  Future<DetailPersonResponse> getPopularMovies(
    @Path("person_id") int? personId,
  );
}