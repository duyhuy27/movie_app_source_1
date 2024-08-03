import 'package:huynd2_assignment/core/resource/page/page_result_response.dart';
import 'package:huynd2_assignment/domain/people/entity/actor_entity.dart';

abstract class PeopleRepository {
  //Api Method
  Future<PageResponse<List<ActorEntity>>> getPopularPeople();
}
