// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SongEntityAdapter extends TypeAdapter<SongEntity> {
  @override
  final int typeId = 0;

  @override
  SongEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SongEntity(
      songName: fields[0] as String,
      thumbnail: fields[1] as String,
      playlistId: fields[2] as String,
      songUrl: fields[3] as String,
      singer: fields[4] as String,
      songLength: fields[5] as int,
      id: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SongEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.songName)
      ..writeByte(1)
      ..write(obj.thumbnail)
      ..writeByte(2)
      ..write(obj.playlistId)
      ..writeByte(3)
      ..write(obj.songUrl)
      ..writeByte(4)
      ..write(obj.singer)
      ..writeByte(5)
      ..write(obj.songLength)
      ..writeByte(6)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
