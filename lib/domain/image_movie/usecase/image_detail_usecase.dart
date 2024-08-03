import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/image_object_response/image_object_response.dart';
import 'package:huynd2_assignment/domain/image_movie/entity/image_movie_entity.dart';
import 'package:huynd2_assignment/domain/image_movie/repository/image_repository.dart';

class ImageDetailUseCase {
  final ImageRepository _imageRepository;

  ImageDetailUseCase(this._imageRepository);

  Future<ImageResponseObject<List<ImageEntity>>> getImageDetailOfMovieUseCase(int movieId) async {
    try {
      return await _imageRepository.getImagesByMovieId(movieId);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
