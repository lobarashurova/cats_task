import 'package:cats_task/data/source/local/cats_model_hive.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class CatsDatabase {
  static int version = 1;
  static String dbName = 'Product.db';

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(CatsModelHiveAdapter());
    await Hive.openBox<CatsModelHive>("cats");
  }

  static final box = Hive.box<CatsModelHive>("cats");
}
