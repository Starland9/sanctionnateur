// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sanction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SanctionAdapter extends TypeAdapter<Sanction> {
  @override
  final int typeId = 2;

  @override
  Sanction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sanction(
      fields[1] as String,
      fields[2] as String,
      fields[3] as DateTime,
      fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Sanction obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.raison)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.fait);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SanctionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
