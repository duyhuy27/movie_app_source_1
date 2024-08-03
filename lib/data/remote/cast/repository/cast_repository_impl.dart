import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/cast_result_response/cast_response.dart';
import 'package:huynd2_assignment/data/remote/cast/api/cast_api_service.dart';
import 'package:huynd2_assignment/domain/cast/entity/cast_entity.dart';
import 'package:huynd2_assignment/domain/cast/repository/cast_repository.dart';

class CastRepositoryImpl extends CastRepository {
  final CastApiService _castApiService;

  CastRepositoryImpl(this._castApiService);

  @override
  Future<CastResponseObject<List<CastEntity>>> fetchCastsInDetailMovie(int movieId) {
    try {
      final httpResponse = _castApiService.getCastByMovieId(movieId);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
  
  @override
  Future<CastResponseObject<List<CastEntity>>> fetchCastsInDetailTv(int tvId) {
   try {
      final httpResponse = _castApiService.getCastByTVId(tvId);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }

    
  }

  
}
