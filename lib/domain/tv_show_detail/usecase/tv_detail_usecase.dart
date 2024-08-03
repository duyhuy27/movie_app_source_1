import 'package:huynd2_assignment/domain/tv_show_detail/enitty/tv_detail_entity.dart';
import 'package:huynd2_assignment/domain/tv_show_detail/repository/tv_detail_repository.dart';

class TVDetailUseCase {
  final TVDetailRepository _repository;

  TVDetailUseCase(this._repository);

  Future<TVDetailEntity> getTVShowDetail(int id) {
    return _repository.getTVShowDetail(id);
  }
}