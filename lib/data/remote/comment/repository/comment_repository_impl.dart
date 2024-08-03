import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/data/remote/comment/api/comment_api_service.dart';
import 'package:huynd2_assignment/data/remote/comment/request/comment_request.dart';
import 'package:huynd2_assignment/data/remote/comment/response/comment_response.dart';
import 'package:huynd2_assignment/domain/comment/entity/comment_entity.dart';
import 'package:huynd2_assignment/domain/comment/repository/comment_repository.dart';

class CommentRepositoryImpl extends CommentRepository {
  final CommentApiService _apiService;

  CommentRepositoryImpl(this._apiService);

  @override
  Future<CommentResponse> addComment(CommentEntity comment) async {
    final http = await _apiService.addComment(CommentRequest(
      id: comment.id,
      postId: comment.postId,
      uid: comment.uid,
      email: comment.email,
      avatar: comment.avatar,
      content: comment.content,
      timestamp: comment.timestamp,
      parentId: comment.parentId,
      username: comment.username,
    ));

    return http;
  }

  @override
  Future<CommentResponse> deleteComment(String commentId) async {
    try {
      final httpResponse = await _apiService.deleteComment(commentId);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<CommentResponse>> getComments(String postId) async {
    try {
      final httpResponse = await _apiService.getComments(postId);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<CommentResponse>> getReplies(String commentId) {
    try {
      final httpResponse = _apiService.getReplies(commentId);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<CommentResponse> updateComment(CommentEntity comment) async {
    try {
      final http = await _apiService.addComment(CommentRequest(
        id: comment.id,
        postId: comment.postId,
        uid: comment.uid,
        email: comment.email,
        avatar: comment.avatar,
        content: comment.content,
        timestamp: comment.timestamp,
        parentId: comment.parentId,
        username: comment.username,
      ));
      return http;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
