import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/domain/tv_show/entity/tv_show_entity.dart';

abstract class TVShowRepository {
  // API method
  Future<PageResponse<List<TVShowEntity>>> getTvShowAirToDay();

  Future<PageResponse<List<TVShowEntity>>> getTvShowPopular();

  Future<PageResponse<List<TVShowEntity>>> getTVShowSimilar(String seriesID);
}
