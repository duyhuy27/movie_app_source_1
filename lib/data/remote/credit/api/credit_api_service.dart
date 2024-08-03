import 'package:dio/dio.dart';
import 'package:huynd2_assignment/core/resource/api/api_endpoint.dart';
import 'package:huynd2_assignment/data/remote/credit/response/credit_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'credit_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoint.baseApiUrl)
abstract class CreditApiService {
  factory CreditApiService(Dio dio) = _CreditApiService;

  @GET(ApiEndPoint.creditEndPoint)
  @Extra({'requiresApiKey': true})
  Future<CreditResponse> getDetailCredit(@Path("credit_id") String id);
}
