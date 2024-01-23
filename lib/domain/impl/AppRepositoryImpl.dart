import 'package:cats_task/data/model/cats_model.dart';
import 'package:cats_task/data/source/local/cats_model_hive.dart';
import 'package:cats_task/data/source/local/database/cats_datbase.dart';
import 'package:cats_task/domain/AppRepository.dart';

import '../../data/source/remote/api/api_service.dart';
import '../../di/app_di.dart';

class AppRepositoryImpl extends AppRepository {
  final _api = getIt<ApiClient>();
  final catsBox = CatsDatabase.box;

  @override
  Future<List<CatsModel>> loadCatsData() async {
    final response = await _api.loadAllCatsData();
    response.shuffle();
    print("date: ${response.firstOrNull?.createdAt}");
    return response;
  }

  @override
  void addUpdates(CatsModelHive catsModelHive) {
    catsBox.add(catsModelHive);
  }

  @override
  List<CatsModelHive> getAllHistoryData() {
    return catsBox.values.toList();
  }
}
