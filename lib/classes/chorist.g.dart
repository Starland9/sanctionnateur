// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chorist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChoristAdapter extends TypeAdapter<Chorist> {
  @override
  final int typeId = 1;

  @override
  Chorist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chorist(
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as DateTime,
    )..sanctions =
        fields[5] == null ? [] : (fields[5] as List).cast<Sanction>();
  }

  @override
  void write(BinaryWriter writer, Chorist obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.pupitre)
      ..writeByte(4)
      ..write(obj.lastPresentDate)
      ..writeByte(5)
      ..write(obj.sanctions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChoristAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
