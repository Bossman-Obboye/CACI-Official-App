// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_hymn_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveHymnModelAdapter extends TypeAdapter<HiveHymnModel> {
  @override
  final int typeId = 2;

  @override
  HiveHymnModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveHymnModel(
      id: fields[0] as String?,
      hymnNumber: fields[1] as int,
      title: fields[2] as String,
      author: fields[3] as String?,
      language: fields[4] as String,
      category: fields[5] as String?,
      tags: (fields[6] as List).cast<String>(),
      stanzas: (fields[7] as List).cast<StanzaModel>(),
      choruses: (fields[8] as List).cast<ChorusModel>(),
      isFavorite: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveHymnModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hymnNumber)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.language)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.tags)
      ..writeByte(7)
      ..write(obj.stanzas)
      ..writeByte(8)
      ..write(obj.choruses)
      ..writeByte(9)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveHymnModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
