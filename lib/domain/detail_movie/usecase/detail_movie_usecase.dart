import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/domain/detail_movie/entity/movie_detail_entity.dart';
import 'package:huynd2_assignment/domain/detail_movie/repository/movie_detail_repository.dart';

class DetailMovieUseCase {
  final MovieDetailRepository _movieDetailRepository;

  DetailMovieUseCase(this._movieDetailRepository);

  Future<MovieDetailEntity> getDetailOfMovieDefaultUseCase(int movieId) async {
    try {
      return _movieDetailRepository.getMovieDetail(movieId);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
