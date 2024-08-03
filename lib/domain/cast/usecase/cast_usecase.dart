import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/cast_result_response/cast_response.dart';
import 'package:huynd2_assignment/domain/cast/entity/cast_entity.dart';
import 'package:huynd2_assignment/domain/cast/repository/cast_repository.dart';

class CastUseCase {
  final CastRepository repository;

  CastUseCase(this.repository);

  Future<CastResponseObject<List<CastEntity>>> getCastOfDetailMovieUseCase(int movieId) async {
    try {
      return repository.fetchCastsInDetailMovie(movieId);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future<CastResponseObject<List<CastEntity>>> getCastOfDetailTvUseCase(int tvId) async {
    try {
      return repository.fetchCastsInDetailTv(tvId);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
