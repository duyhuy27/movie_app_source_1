import 'package:dio/dio.dart';
import 'package:huynd2_assignment/core/resource/api/api_endpoint.dart';
import 'package:huynd2_assignment/core/resource/image_object_response/image_object_response.dart';
import 'package:huynd2_assignment/data/remote/image/response/image_response.dart';
import 'package:retrofit/retrofit.dart';

part 'image_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoint.baseApiUrl)
abstract class ImageApiService {
  factory ImageApiService(Dio dio) = _ImageApiService;

  @GET(ApiEndPoint.imageEndPoint)
  @Extra({'requiresApiKey': true})
  Future<ImageResponseObject<List<ImageResponse>>> getMovieImages(
    @Path("movie_id") int movieId,
  );
}
