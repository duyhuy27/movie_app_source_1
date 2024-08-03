import 'package:dio/dio.dart';
import 'package:huynd2_assignment/core/resource/api/api_endpoint.dart';
import 'package:huynd2_assignment/data/remote/shared/response/shared_response.dart';
import 'package:retrofit/retrofit.dart';

part 'shared_api_service.g.dart';

@RestApi(baseUrl: 'http://localhost:3000')
abstract class SharedApiService {
  factory SharedApiService(Dio dio, {String baseUrl}) = _SharedApiService;

  @GET(ApiEndPoint.shareEndPoint)
  Future<List<SharedResponse>> getSharedByUid(@Query('uid') String uid);

  @GET(ApiEndPoint.shareEndPoint)
  Future<List<SharedResponse>> getAllShared();

  @POST(ApiEndPoint.shareEndPoint)
  Future<SharedResponse> postShared(@Body() SharedResponse sharedResponse);

  @DELETE(ApiEndPoint.shareDeleteEndPoint)
  Future<SharedResponse> deleteShared(@Path('id') String id);

  @PUT(ApiEndPoint.shareUpdateEndPoint)
  Future<SharedResponse> updateShared(@Path('id') String id, @Body() SharedResponse sharedResponse);
}
