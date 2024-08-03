import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/data/remote/person_detail/api/detail_person_api_service.dart';
import 'package:huynd2_assignment/data/remote/person_detail/response/detail_person_response.dart';
import 'package:huynd2_assignment/domain/detail_people/repository/detail_person_repository.dart';

class DetailPersonRepositoryImpl implements PersonDetailRepository {
  final DetailPersonApiService remoteDataSource;


  DetailPersonRepositoryImpl(this.remoteDataSource);

  @override
  Future<DetailPersonResponse> fetchPersonDetail(int id) async {
    try {
      final httpResponse = await remoteDataSource.getPopularMovies(id);
      return httpResponse;
    } on ApiException catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
