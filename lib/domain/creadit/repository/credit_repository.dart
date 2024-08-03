import 'package:huynd2_assignment/domain/creadit/entity/credit_entity.dart';

abstract class CreditRepository {
  Future<CreditEntity> getCreditDetail(String id);
}
