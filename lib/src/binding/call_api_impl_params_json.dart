/// GENERATED BY terra, DO NOT MODIFY BY HAND.

// ignore_for_file: public_member_api_docs, unused_local_variable, unused_import

import 'package:agora_rtc_engine/src/binding_forward_export.dart';
part 'call_api_impl_params_json.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MediaPlayerGetDurationJson {
  const MediaPlayerGetDurationJson(this.duration);

  @JsonKey(name: 'duration')
  final int duration;

  factory MediaPlayerGetDurationJson.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerGetDurationJsonFromJson(json);

  Map<String, dynamic> toJson() => _$MediaPlayerGetDurationJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MediaPlayerGetPlayPositionJson {
  const MediaPlayerGetPlayPositionJson(this.pos);

  @JsonKey(name: 'pos')
  final int pos;

  factory MediaPlayerGetPlayPositionJson.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerGetPlayPositionJsonFromJson(json);

  Map<String, dynamic> toJson() => _$MediaPlayerGetPlayPositionJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MediaPlayerGetStreamCountJson {
  const MediaPlayerGetStreamCountJson(this.count);

  @JsonKey(name: 'count')
  final int count;

  factory MediaPlayerGetStreamCountJson.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerGetStreamCountJsonFromJson(json);

  Map<String, dynamic> toJson() => _$MediaPlayerGetStreamCountJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MediaPlayerGetStreamInfoJson {
  const MediaPlayerGetStreamInfoJson(this.info);

  @JsonKey(name: 'info')
  final PlayerStreamInfo info;

  factory MediaPlayerGetStreamInfoJson.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerGetStreamInfoJsonFromJson(json);

  Map<String, dynamic> toJson() => _$MediaPlayerGetStreamInfoJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MediaPlayerGetMuteJson {
  const MediaPlayerGetMuteJson(this.muted);

  @JsonKey(name: 'muted')
  final bool muted;

  factory MediaPlayerGetMuteJson.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerGetMuteJsonFromJson(json);

  Map<String, dynamic> toJson() => _$MediaPlayerGetMuteJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MediaPlayerGetPlayoutVolumeJson {
  const MediaPlayerGetPlayoutVolumeJson(this.volume);

  @JsonKey(name: 'volume')
  final int volume;

  factory MediaPlayerGetPlayoutVolumeJson.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerGetPlayoutVolumeJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MediaPlayerGetPlayoutVolumeJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MediaPlayerGetPublishSignalVolumeJson {
  const MediaPlayerGetPublishSignalVolumeJson(this.volume);

  @JsonKey(name: 'volume')
  final int volume;

  factory MediaPlayerGetPublishSignalVolumeJson.fromJson(
          Map<String, dynamic> json) =>
      _$MediaPlayerGetPublishSignalVolumeJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MediaPlayerGetPublishSignalVolumeJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MediaPlayerGetPlayerOptionInIntJson {
  const MediaPlayerGetPlayerOptionInIntJson(this.value);

  @JsonKey(name: 'value')
  final int value;

  factory MediaPlayerGetPlayerOptionInIntJson.fromJson(
          Map<String, dynamic> json) =>
      _$MediaPlayerGetPlayerOptionInIntJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MediaPlayerGetPlayerOptionInIntJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MediaPlayerGetPlayerOptionInStringJson {
  const MediaPlayerGetPlayerOptionInStringJson(this.value);

  @JsonKey(name: 'value')
  final String value;

  factory MediaPlayerGetPlayerOptionInStringJson.fromJson(
          Map<String, dynamic> json) =>
      _$MediaPlayerGetPlayerOptionInStringJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MediaPlayerGetPlayerOptionInStringJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MediaPlayerCacheManagerGetCacheDirJson {
  const MediaPlayerCacheManagerGetCacheDirJson(this.path);

  @JsonKey(name: 'path')
  final String path;

  factory MediaPlayerCacheManagerGetCacheDirJson.fromJson(
          Map<String, dynamic> json) =>
      _$MediaPlayerCacheManagerGetCacheDirJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MediaPlayerCacheManagerGetCacheDirJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MusicContentCenterGetMusicChartsJson {
  const MusicContentCenterGetMusicChartsJson(this.requestId);

  @JsonKey(name: 'requestId')
  final String requestId;

  factory MusicContentCenterGetMusicChartsJson.fromJson(
          Map<String, dynamic> json) =>
      _$MusicContentCenterGetMusicChartsJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MusicContentCenterGetMusicChartsJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MusicContentCenterGetMusicCollectionByMusicChartIdJson {
  const MusicContentCenterGetMusicCollectionByMusicChartIdJson(this.requestId);

  @JsonKey(name: 'requestId')
  final String requestId;

  factory MusicContentCenterGetMusicCollectionByMusicChartIdJson.fromJson(
          Map<String, dynamic> json) =>
      _$MusicContentCenterGetMusicCollectionByMusicChartIdJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MusicContentCenterGetMusicCollectionByMusicChartIdJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MusicContentCenterSearchMusicJson {
  const MusicContentCenterSearchMusicJson(this.requestId);

  @JsonKey(name: 'requestId')
  final String requestId;

  factory MusicContentCenterSearchMusicJson.fromJson(
          Map<String, dynamic> json) =>
      _$MusicContentCenterSearchMusicJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MusicContentCenterSearchMusicJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MusicContentCenterPreloadJson {
  const MusicContentCenterPreloadJson(this.requestId);

  @JsonKey(name: 'requestId')
  final String requestId;

  factory MusicContentCenterPreloadJson.fromJson(Map<String, dynamic> json) =>
      _$MusicContentCenterPreloadJsonFromJson(json);

  Map<String, dynamic> toJson() => _$MusicContentCenterPreloadJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MusicContentCenterGetCachesJson {
  const MusicContentCenterGetCachesJson(this.cacheInfo);

  @JsonKey(name: 'cacheInfo')
  final List<MusicCacheInfo> cacheInfo;

  factory MusicContentCenterGetCachesJson.fromJson(Map<String, dynamic> json) =>
      _$MusicContentCenterGetCachesJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MusicContentCenterGetCachesJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MusicContentCenterGetLyricJson {
  const MusicContentCenterGetLyricJson(this.requestId);

  @JsonKey(name: 'requestId')
  final String requestId;

  factory MusicContentCenterGetLyricJson.fromJson(Map<String, dynamic> json) =>
      _$MusicContentCenterGetLyricJsonFromJson(json);

  Map<String, dynamic> toJson() => _$MusicContentCenterGetLyricJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MusicContentCenterGetSongSimpleInfoJson {
  const MusicContentCenterGetSongSimpleInfoJson(this.requestId);

  @JsonKey(name: 'requestId')
  final String requestId;

  factory MusicContentCenterGetSongSimpleInfoJson.fromJson(
          Map<String, dynamic> json) =>
      _$MusicContentCenterGetSongSimpleInfoJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MusicContentCenterGetSongSimpleInfoJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MusicContentCenterGetInternalSongCodeJson {
  const MusicContentCenterGetInternalSongCodeJson(this.internalSongCode);

  @JsonKey(name: 'internalSongCode')
  final int internalSongCode;

  factory MusicContentCenterGetInternalSongCodeJson.fromJson(
          Map<String, dynamic> json) =>
      _$MusicContentCenterGetInternalSongCodeJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MusicContentCenterGetInternalSongCodeJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class VideoDeviceManagerGetDeviceJson {
  const VideoDeviceManagerGetDeviceJson(this.deviceIdUTF8);

  @JsonKey(name: 'deviceIdUTF8')
  final String deviceIdUTF8;

  factory VideoDeviceManagerGetDeviceJson.fromJson(Map<String, dynamic> json) =>
      _$VideoDeviceManagerGetDeviceJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VideoDeviceManagerGetDeviceJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class VideoDeviceManagerGetCapabilityJson {
  const VideoDeviceManagerGetCapabilityJson(this.capability);

  @JsonKey(name: 'capability')
  final VideoFormat capability;

  factory VideoDeviceManagerGetCapabilityJson.fromJson(
          Map<String, dynamic> json) =>
      _$VideoDeviceManagerGetCapabilityJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VideoDeviceManagerGetCapabilityJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineQueryCodecCapabilityJson {
  const RtcEngineQueryCodecCapabilityJson(this.codecInfo);

  @JsonKey(name: 'codecInfo')
  final List<CodecCapInfo> codecInfo;

  factory RtcEngineQueryCodecCapabilityJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineQueryCodecCapabilityJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtcEngineQueryCodecCapabilityJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineGetFaceShapeBeautyOptionsJson {
  const RtcEngineGetFaceShapeBeautyOptionsJson(this.options);

  @JsonKey(name: 'options')
  final FaceShapeBeautyOptions options;

  factory RtcEngineGetFaceShapeBeautyOptionsJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineGetFaceShapeBeautyOptionsJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtcEngineGetFaceShapeBeautyOptionsJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineGetFaceShapeAreaOptionsJson {
  const RtcEngineGetFaceShapeAreaOptionsJson(this.options);

  @JsonKey(name: 'options')
  final FaceShapeAreaOptions options;

  factory RtcEngineGetFaceShapeAreaOptionsJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineGetFaceShapeAreaOptionsJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtcEngineGetFaceShapeAreaOptionsJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineUploadLogFileJson {
  const RtcEngineUploadLogFileJson(this.requestId);

  @JsonKey(name: 'requestId')
  final String requestId;

  factory RtcEngineUploadLogFileJson.fromJson(Map<String, dynamic> json) =>
      _$RtcEngineUploadLogFileJsonFromJson(json);

  Map<String, dynamic> toJson() => _$RtcEngineUploadLogFileJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineGetExtensionPropertyJson {
  const RtcEngineGetExtensionPropertyJson(this.value);

  @JsonKey(name: 'value')
  final String value;

  factory RtcEngineGetExtensionPropertyJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineGetExtensionPropertyJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtcEngineGetExtensionPropertyJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineGetAudioDeviceInfoJson {
  const RtcEngineGetAudioDeviceInfoJson(this.deviceInfo);

  @JsonKey(name: 'deviceInfo')
  final DeviceInfo deviceInfo;

  factory RtcEngineGetAudioDeviceInfoJson.fromJson(Map<String, dynamic> json) =>
      _$RtcEngineGetAudioDeviceInfoJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtcEngineGetAudioDeviceInfoJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineQueryCameraFocalLengthCapabilityJson {
  const RtcEngineQueryCameraFocalLengthCapabilityJson(this.focalLengthInfos);

  @JsonKey(name: 'focalLengthInfos')
  final List<FocalLengthInfo> focalLengthInfos;

  factory RtcEngineQueryCameraFocalLengthCapabilityJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineQueryCameraFocalLengthCapabilityJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtcEngineQueryCameraFocalLengthCapabilityJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineGetCallIdJson {
  const RtcEngineGetCallIdJson(this.callId);

  @JsonKey(name: 'callId')
  final String callId;

  factory RtcEngineGetCallIdJson.fromJson(Map<String, dynamic> json) =>
      _$RtcEngineGetCallIdJsonFromJson(json);

  Map<String, dynamic> toJson() => _$RtcEngineGetCallIdJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineCreateDataStreamJson {
  const RtcEngineCreateDataStreamJson(this.streamId);

  @JsonKey(name: 'streamId')
  final int streamId;

  factory RtcEngineCreateDataStreamJson.fromJson(Map<String, dynamic> json) =>
      _$RtcEngineCreateDataStreamJsonFromJson(json);

  Map<String, dynamic> toJson() => _$RtcEngineCreateDataStreamJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineGetUserInfoByUserAccountJson {
  const RtcEngineGetUserInfoByUserAccountJson(this.userInfo);

  @JsonKey(name: 'userInfo')
  final UserInfo userInfo;

  factory RtcEngineGetUserInfoByUserAccountJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineGetUserInfoByUserAccountJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtcEngineGetUserInfoByUserAccountJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineGetUserInfoByUidJson {
  const RtcEngineGetUserInfoByUidJson(this.userInfo);

  @JsonKey(name: 'userInfo')
  final UserInfo userInfo;

  factory RtcEngineGetUserInfoByUidJson.fromJson(Map<String, dynamic> json) =>
      _$RtcEngineGetUserInfoByUidJsonFromJson(json);

  Map<String, dynamic> toJson() => _$RtcEngineGetUserInfoByUidJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineGetUserInfoByUidWithChannelIdJson {
  const RtcEngineGetUserInfoByUidWithChannelIdJson(this.userInfo);

  @JsonKey(name: 'userInfo')
  final UserInfo userInfo;

  factory RtcEngineGetUserInfoByUidWithChannelIdJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineGetUserInfoByUidWithChannelIdJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtcEngineGetUserInfoByUidWithChannelIdJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineGetUserInfoByUserAccountWithChannelIdJson {
  const RtcEngineGetUserInfoByUserAccountWithChannelIdJson(this.userInfo);

  @JsonKey(name: 'userInfo')
  final UserInfo userInfo;

  factory RtcEngineGetUserInfoByUserAccountWithChannelIdJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineGetUserInfoByUserAccountWithChannelIdJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtcEngineGetUserInfoByUserAccountWithChannelIdJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineExCreateDataStreamExJson {
  const RtcEngineExCreateDataStreamExJson(this.streamId);

  @JsonKey(name: 'streamId')
  final int streamId;

  factory RtcEngineExCreateDataStreamExJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineExCreateDataStreamExJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtcEngineExCreateDataStreamExJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineExGetUserInfoByUserAccountExJson {
  const RtcEngineExGetUserInfoByUserAccountExJson(this.userInfo);

  @JsonKey(name: 'userInfo')
  final UserInfo userInfo;

  factory RtcEngineExGetUserInfoByUserAccountExJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineExGetUserInfoByUserAccountExJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtcEngineExGetUserInfoByUserAccountExJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineExGetUserInfoByUidExJson {
  const RtcEngineExGetUserInfoByUidExJson(this.userInfo);

  @JsonKey(name: 'userInfo')
  final UserInfo userInfo;

  factory RtcEngineExGetUserInfoByUidExJson.fromJson(
          Map<String, dynamic> json) =>
      _$RtcEngineExGetUserInfoByUidExJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtcEngineExGetUserInfoByUidExJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtcEngineExGetCallIdExJson {
  const RtcEngineExGetCallIdExJson(this.callId);

  @JsonKey(name: 'callId')
  final String callId;

  factory RtcEngineExGetCallIdExJson.fromJson(Map<String, dynamic> json) =>
      _$RtcEngineExGetCallIdExJsonFromJson(json);

  Map<String, dynamic> toJson() => _$RtcEngineExGetCallIdExJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AudioDeviceManagerGetPlaybackDeviceJson {
  const AudioDeviceManagerGetPlaybackDeviceJson(this.deviceId);

  @JsonKey(name: 'deviceId')
  final String deviceId;

  factory AudioDeviceManagerGetPlaybackDeviceJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetPlaybackDeviceJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetPlaybackDeviceJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AudioDeviceManagerGetPlaybackDeviceVolumeJson {
  const AudioDeviceManagerGetPlaybackDeviceVolumeJson(this.volume);

  @JsonKey(name: 'volume')
  final int volume;

  factory AudioDeviceManagerGetPlaybackDeviceVolumeJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetPlaybackDeviceVolumeJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetPlaybackDeviceVolumeJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AudioDeviceManagerGetRecordingDeviceJson {
  const AudioDeviceManagerGetRecordingDeviceJson(this.deviceId);

  @JsonKey(name: 'deviceId')
  final String deviceId;

  factory AudioDeviceManagerGetRecordingDeviceJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetRecordingDeviceJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetRecordingDeviceJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AudioDeviceManagerGetRecordingDeviceVolumeJson {
  const AudioDeviceManagerGetRecordingDeviceVolumeJson(this.volume);

  @JsonKey(name: 'volume')
  final int volume;

  factory AudioDeviceManagerGetRecordingDeviceVolumeJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetRecordingDeviceVolumeJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetRecordingDeviceVolumeJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AudioDeviceManagerGetLoopbackDeviceJson {
  const AudioDeviceManagerGetLoopbackDeviceJson(this.deviceId);

  @JsonKey(name: 'deviceId')
  final String deviceId;

  factory AudioDeviceManagerGetLoopbackDeviceJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetLoopbackDeviceJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetLoopbackDeviceJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AudioDeviceManagerGetPlaybackDeviceMuteJson {
  const AudioDeviceManagerGetPlaybackDeviceMuteJson(this.mute);

  @JsonKey(name: 'mute')
  final bool mute;

  factory AudioDeviceManagerGetPlaybackDeviceMuteJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetPlaybackDeviceMuteJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetPlaybackDeviceMuteJsonToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AudioDeviceManagerGetRecordingDeviceMuteJson {
  const AudioDeviceManagerGetRecordingDeviceMuteJson(this.mute);

  @JsonKey(name: 'mute')
  final bool mute;

  factory AudioDeviceManagerGetRecordingDeviceMuteJson.fromJson(
          Map<String, dynamic> json) =>
      _$AudioDeviceManagerGetRecordingDeviceMuteJsonFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AudioDeviceManagerGetRecordingDeviceMuteJsonToJson(this);
}
