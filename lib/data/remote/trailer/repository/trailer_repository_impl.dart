import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/data/remote/trailer/api/trailer_api_service.dart';
import 'package:huynd2_assignment/data/remote/trailer/response/trailer_response.dart';
import 'package:huynd2_assignment/domain/trailer/repository/trailer_repository.dart';

class TrailerRepositoryImpl extends TrailerRepository {
  final TrailerApiService _trailerApiService;

  TrailerRepositoryImpl(this._trailerApiService);

  @override
  Future<PageResponse<List<TrailerResponse>>> getTrailers(int id) async {
    try {
      final httpResponse = await _trailerApiService.getTrailers(id);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
