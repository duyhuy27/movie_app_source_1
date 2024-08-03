

import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/genres_result/genres_result.dart';
import 'package:huynd2_assignment/domain/genres/repository/genres_repository.dart';
import 'package:huynd2_assignment/domain/movie/entity/generic_entity.dart';

class GenresUseCase {
  final GenresRepository _genresRepository;

  GenresUseCase(this._genresRepository);

  Future<GenresResult<List<GenresEntity>>> getGenres() async {
    try {
      return await _genresRepository.getGenres();
    } on ApiException catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}