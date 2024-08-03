
import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/image_object_response/image_object_response.dart';
import 'package:huynd2_assignment/data/remote/image/api/image_api_service.dart';
import 'package:huynd2_assignment/data/remote/image/response/image_response.dart';
import 'package:huynd2_assignment/domain/image_movie/repository/image_repository.dart';

class ImageRepositoryImpl extends ImageRepository {
  final ImageApiService _imageApiService;


  ImageRepositoryImpl(this._imageApiService);
  @override
  Future<ImageResponseObject<List<ImageResponse>>> getImagesByMovieId(int movieId) async {
    try {
      final httpResponse = await _imageApiService.getMovieImages(movieId);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }


}
