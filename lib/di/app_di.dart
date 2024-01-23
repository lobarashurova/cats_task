import 'package:cats_task/data/source/remote/api/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../domain/AppRepository.dart';
import '../domain/impl/AppRepositoryImpl.dart';

final getIt = GetIt.instance;
final dio = Dio(BaseOptions(
    baseUrl: 'https://cat-fact.herokuapp.com',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    contentType: 'application/json',
    receiveDataWhenStatusError: true));

void setup() {
  getIt.registerSingleton<ApiClient>(ApiClient(dio));
  getIt.registerSingleton<AppRepository>(AppRepositoryImpl());
}
