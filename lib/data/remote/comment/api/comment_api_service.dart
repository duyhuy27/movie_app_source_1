import 'package:dio/dio.dart';
import 'package:huynd2_assignment/core/resource/api/api_endpoint.dart';
import 'package:huynd2_assignment/data/remote/comment/request/comment_request.dart';
import 'package:huynd2_assignment/data/remote/comment/response/comment_response.dart';
import 'package:retrofit/retrofit.dart';

part 'comment_api_service.g.dart';

@RestApi(baseUrl: "http://localhost:3000")
abstract class CommentApiService {
  factory CommentApiService(Dio dio) = _CommentApiService;

  @POST(ApiEndPoint.commentEndPoint)
  Future<CommentResponse> addComment(@Body() CommentRequest comment);

  @DELETE(ApiEndPoint.commentDeleteEndPoint)
  Future<CommentResponse> deleteComment(@Path("id") String commentId);

  @PUT(ApiEndPoint.commentUpdateEndPoint)
  Future<CommentResponse> updateComment(
      @Path("id") String commentId, @Body() CommentRequest comment);

  @GET(ApiEndPoint.commentGetEndPoint)
  Future<List<CommentResponse>> getComments(@Query("postId") String postId);

  @GET(ApiEndPoint.commentGetRepliesEndPoint)
  Future<List<CommentResponse>> getReplies(@Query("id") String commentId);
}
