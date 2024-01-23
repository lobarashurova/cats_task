import 'package:cats_task/data/source/local/cats_model_hive.dart';

import '../data/model/cats_model.dart';

abstract class AppRepository{
  Future<List<CatsModel>> loadCatsData();
  void addUpdates(CatsModelHive catsModelHive);
  List<CatsModelHive> getAllHistoryData();
}