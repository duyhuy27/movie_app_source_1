import 'package:huynd2_assignment/core/resource/image_object_response/image_object_response.dart';
import 'package:huynd2_assignment/domain/image_movie/entity/image_movie_entity.dart';

abstract class ImageRepository {
  Future<ImageResponseObject<List<ImageEntity>>> getImagesByMovieId(int movieId);
}
