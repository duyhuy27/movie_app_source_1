import 'package:huynd2_assignment/core/resource/api/api_exception.dart';
import 'package:huynd2_assignment/core/resource/genres_result/genres_result.dart';

import 'package:huynd2_assignment/data/remote/genres/api/genres_api_service.dart';
import 'package:huynd2_assignment/data/remote/genres/response/genres_response.dart';
import 'package:huynd2_assignment/domain/genres/repository/genres_repository.dart';


class GenresRepositoryImpl implements GenresRepository {
  final GenresApiService _genresApiService;

  GenresRepositoryImpl(this._genresApiService);

  @override
  Future<GenresResult<List<GenresResponse>>> getGenres() async {
    try {
      final httpResponse = await _genresApiService.getGenres();
      return httpResponse;
    } on ApiException catch (e) {
      throw ApiException(message: e.toString());
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }


}
