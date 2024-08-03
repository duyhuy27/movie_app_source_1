import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/data/remote/credit/api/credit_api_service.dart';
import 'package:huynd2_assignment/data/remote/credit/response/credit_response.dart';
import 'package:huynd2_assignment/domain/creadit/repository/credit_repository.dart';

class CreditRepositoryImpl extends CreditRepository {
  final CreditApiService _creditApiService;

  CreditRepositoryImpl(this._creditApiService);
  @override
  Future<CreditResponse> getCreditDetail(String id) {
    try {
      final httpResponse = _creditApiService.getDetailCredit(id);
      return httpResponse;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
