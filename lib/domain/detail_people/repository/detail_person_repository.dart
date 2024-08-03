
import 'package:huynd2_assignment/domain/detail_people/entity/detail_person_entity.dart';


abstract class PersonDetailRepository{
  Future<PersonDetail> fetchPersonDetail(int personId);
}