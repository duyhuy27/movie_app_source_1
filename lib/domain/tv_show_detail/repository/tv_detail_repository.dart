

import 'package:huynd2_assignment/domain/tv_show_detail/enitty/tv_detail_entity.dart';

abstract class TVDetailRepository {
  Future<TVDetailEntity> getTVShowDetail(int id);
}