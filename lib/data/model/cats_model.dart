import 'package:freezed_annotation/freezed_annotation.dart';
part 'cats_model.freezed.dart';

part 'cats_model.g.dart';

@freezed
class CatsModel with _$CatsModel {
  const factory CatsModel(
    Status? status,
    String? id,
    String? user,
    String? text,
    int? v,
    String? source,
    DateTime? updatedAt,
    String? type,
    DateTime? createdAt,
    bool? deleted,
    bool? used,
  ) = _CatsModel;

  factory CatsModel.fromJson(Map<String, dynamic> json) =>
      _$CatsModelFromJson(json);
}

@freezed
class Status with _$Status {
  @JsonSerializable(explicitToJson: true,fieldRename: FieldRename.snake)

  const factory Status(
  bool? verified,
  int? sentCount,
      ) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}

