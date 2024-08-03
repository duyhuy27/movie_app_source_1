

import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/data/remote/tv_detail/api/tv_detail_api_service.dart';
import 'package:huynd2_assignment/domain/tv_show_detail/enitty/tv_detail_entity.dart';
import 'package:huynd2_assignment/domain/tv_show_detail/repository/tv_detail_repository.dart';

class TVDetailRepositoryImpl extends TVDetailRepository {
  final TvDetailApiService _tvDetailApiService;

  TVDetailRepositoryImpl(this._tvDetailApiService);

  @override
  Future<TVDetailEntity> getTVShowDetail(int id) {
    try {
      final httpResponse = _tvDetailApiService.getTvDetail(id);
      return httpResponse;
    }on ApiException catch (e) {
      throw ApiException(message: e.toString());
    }
    catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  
}