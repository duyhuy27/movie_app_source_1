import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/domain/trailer/entity/trailer_entity.dart';
import 'package:huynd2_assignment/domain/trailer/repository/trailer_repository.dart';

class TrailerUseCase {
  final TrailerRepository _trailerRepository;

  TrailerUseCase(this._trailerRepository);

  Future<PageResponse<List<TrailerEntity>>> getTrailerByIdUseCase(int id) {
    try {
      return _trailerRepository.getTrailers(id);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
