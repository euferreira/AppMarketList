// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsHiveAdapter extends TypeAdapter<ProductsHive> {
  @override
  final int typeId = 1;

  @override
  ProductsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductsHive(
      id: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as double?,
      category: fields[3] as CategoriesHive?,
      image: fields[4] as String?,
      observation: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductsHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.observation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
