// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsModalAdapter extends TypeAdapter<SettingsModal> {
  @override
  final int typeId = 0;

  @override
  SettingsModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsModal(
      pomodoro: fields[0] as int,
      shortBreak: fields[1] as int,
      longBreak: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.pomodoro)
      ..writeByte(1)
      ..write(obj.shortBreak)
      ..writeByte(2)
      ..write(obj.longBreak);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
