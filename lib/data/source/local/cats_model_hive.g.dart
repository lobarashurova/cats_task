// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatsModelHiveAdapter extends TypeAdapter<CatsModelHive> {
  @override
  final int typeId = 0;

  @override
  CatsModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatsModelHive(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatsModelHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.creationDate)
      ..writeByte(2)
      ..write(obj.updatedTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatsModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
