

import 'package:huynd2_assignment/core/resource/genres_result/genres_result.dart';
import 'package:huynd2_assignment/domain/movie/entity/generic_entity.dart';

abstract class GenresRepository {
  Future<GenresResult<List<GenresEntity>>> getGenres();
}