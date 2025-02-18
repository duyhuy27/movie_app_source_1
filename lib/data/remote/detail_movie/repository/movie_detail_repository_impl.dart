
import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/data/remote/detail_movie/api/movie_detail_api_service.dart';
import 'package:huynd2_assignment/data/remote/detail_movie/response/movie_detail_response.dart';
import 'package:huynd2_assignment/domain/detail_movie/repository/movie_detail_repository.dart';

class MovieDetailRepositoryImpl extends MovieDetailRepository {
  final MovieDetailApiService _movieDetailApiService;


  MovieDetailRepositoryImpl(this._movieDetailApiService);

  @override
  Future<MovieDetailResponse> getMovieDetail(int movieId) async {
    try {
      final httpResponse = await _movieDetailApiService.getMovieDetail(movieId);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
