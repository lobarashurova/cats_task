import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../model/cats_model.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/facts')
  Future<List<CatsModel>> loadAllCatsData();
}
