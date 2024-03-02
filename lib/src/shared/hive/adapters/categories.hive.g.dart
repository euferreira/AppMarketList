// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoriesHiveAdapter extends TypeAdapter<CategoriesHive> {
  @override
  final int typeId = 0;

  @override
  CategoriesHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoriesHive(
      name: fields[0] as String,
      icon: fields[1] as IconData?,
      image: fields[2] as String?,
      id: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoriesHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
