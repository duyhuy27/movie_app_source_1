import 'package:huynd2_assignment/domain/detail_movie/entity/movie_detail_entity.dart';

abstract class MovieDetailRepository {
  // API method
  Future<MovieDetailEntity> getMovieDetail(int movieId);
}
