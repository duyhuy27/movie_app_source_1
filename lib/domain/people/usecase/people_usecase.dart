import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/domain/people/repository/people_repository.dart';

import '../../../core/resource/page/page_result_response.dart';
import '../entity/actor_entity.dart';

class PeopleUseCase {
  final PeopleRepository _peopleRepository;

  PeopleUseCase(this._peopleRepository);

  Future<PageResponse<List<ActorEntity>>> getPopularPeopleUseCase() async {
    try {
      return _peopleRepository.getPopularPeople();
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
