import 'package:hive/hive.dart';

part 'cats_model_hive.g.dart';

@HiveType(typeId: 0)
class CatsModelHive extends HiveObject {
  @HiveField(0)
  String data;
  @HiveField(1)
  String creationDate;
  @HiveField(2)
  String updatedTime;

  CatsModelHive(this.data, this.creationDate, this.updatedTime);

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'creationDate': creationDate,
      'updatedTime': updatedTime,
    };
  }

  factory CatsModelHive.fromMap(Map<dynamic, dynamic> map) {
    return CatsModelHive(map['data'], map['creationDate'], map['updatedTime']);
  }
}
