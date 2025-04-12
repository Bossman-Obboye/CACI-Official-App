// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_stanza_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveStanzaModelAdapter extends TypeAdapter<HiveStanzaModel> {
  @override
  final int typeId = 0;

  @override
  HiveStanzaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveStanzaModel(
      stanzaNumber: fields[0] as int,
      lines: (fields[1] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveStanzaModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.stanzaNumber)
      ..writeByte(1)
      ..write(obj.lines);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveStanzaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
