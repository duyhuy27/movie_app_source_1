

import 'package:huynd2_assignment/domain/detail_people/entity/detail_person_entity.dart';
import 'package:huynd2_assignment/domain/detail_people/repository/detail_person_repository.dart';

class DetailPersonUsecase {
  final PersonDetailRepository _repository;

  DetailPersonUsecase(this._repository);

  Future<PersonDetail> getPersonDetail(int id) async {
    return await _repository.fetchPersonDetail(id);
  }
}