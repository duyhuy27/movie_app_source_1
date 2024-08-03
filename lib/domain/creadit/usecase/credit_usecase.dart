import 'package:huynd2_assignment/domain/creadit/entity/credit_entity.dart';
import 'package:huynd2_assignment/domain/creadit/repository/credit_repository.dart';

class CreditUseCase {
  final CreditRepository _creditRepository;

  CreditUseCase(this._creditRepository);

  Future<CreditEntity> getDetailCreditUseCase(String id) async {
    try {
      return _creditRepository.getCreditDetail(id);
    } catch (e) {
      rethrow;
    }
  }

  
}
