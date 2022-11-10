// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'face_frame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FaceFrame {
  Uint8List? get videoFrame => throw _privateConstructorUsedError;
  List<FaceInfo>? get faceInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FaceFrameCopyWith<FaceFrame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceFrameCopyWith<$Res> {
  factory $FaceFrameCopyWith(FaceFrame value, $Res Function(FaceFrame) then) =
      _$FaceFrameCopyWithImpl<$Res, FaceFrame>;
  @useResult
  $Res call({Uint8List? videoFrame, List<FaceInfo>? faceInfo});
}

/// @nodoc
class _$FaceFrameCopyWithImpl<$Res, $Val extends FaceFrame>
    implements $FaceFrameCopyWith<$Res> {
  _$FaceFrameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoFrame = freezed,
    Object? faceInfo = freezed,
  }) {
    return _then(_value.copyWith(
      videoFrame: freezed == videoFrame
          ? _value.videoFrame
          : videoFrame // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      faceInfo: freezed == faceInfo
          ? _value.faceInfo
          : faceInfo // ignore: cast_nullable_to_non_nullable
              as List<FaceInfo>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FaceFrameStateCopyWith<$Res>
    implements $FaceFrameCopyWith<$Res> {
  factory _$$_FaceFrameStateCopyWith(
          _$_FaceFrameState value, $Res Function(_$_FaceFrameState) then) =
      __$$_FaceFrameStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uint8List? videoFrame, List<FaceInfo>? faceInfo});
}

/// @nodoc
class __$$_FaceFrameStateCopyWithImpl<$Res>
    extends _$FaceFrameCopyWithImpl<$Res, _$_FaceFrameState>
    implements _$$_FaceFrameStateCopyWith<$Res> {
  __$$_FaceFrameStateCopyWithImpl(
      _$_FaceFrameState _value, $Res Function(_$_FaceFrameState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoFrame = freezed,
    Object? faceInfo = freezed,
  }) {
    return _then(_$_FaceFrameState(
      videoFrame: freezed == videoFrame
          ? _value.videoFrame
          : videoFrame // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      faceInfo: freezed == faceInfo
          ? _value._faceInfo
          : faceInfo // ignore: cast_nullable_to_non_nullable
              as List<FaceInfo>?,
    ));
  }
}

/// @nodoc

class _$_FaceFrameState implements _FaceFrameState {
  const _$_FaceFrameState({this.videoFrame, final List<FaceInfo>? faceInfo})
      : _faceInfo = faceInfo;

  @override
  final Uint8List? videoFrame;
  final List<FaceInfo>? _faceInfo;
  @override
  List<FaceInfo>? get faceInfo {
    final value = _faceInfo;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FaceFrame(videoFrame: $videoFrame, faceInfo: $faceInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FaceFrameState &&
            const DeepCollectionEquality()
                .equals(other.videoFrame, videoFrame) &&
            const DeepCollectionEquality().equals(other._faceInfo, _faceInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(videoFrame),
      const DeepCollectionEquality().hash(_faceInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FaceFrameStateCopyWith<_$_FaceFrameState> get copyWith =>
      __$$_FaceFrameStateCopyWithImpl<_$_FaceFrameState>(this, _$identity);
}

abstract class _FaceFrameState implements FaceFrame {
  const factory _FaceFrameState(
      {final Uint8List? videoFrame,
      final List<FaceInfo>? faceInfo}) = _$_FaceFrameState;

  @override
  Uint8List? get videoFrame;
  @override
  List<FaceInfo>? get faceInfo;
  @override
  @JsonKey(ignore: true)
  _$$_FaceFrameStateCopyWith<_$_FaceFrameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FaceInfo {
// String? reservedField,
  Float64List? get faceEncoding => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FaceInfoCopyWith<FaceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceInfoCopyWith<$Res> {
  factory $FaceInfoCopyWith(FaceInfo value, $Res Function(FaceInfo) then) =
      _$FaceInfoCopyWithImpl<$Res, FaceInfo>;
  @useResult
  $Res call({Float64List? faceEncoding});
}

/// @nodoc
class _$FaceInfoCopyWithImpl<$Res, $Val extends FaceInfo>
    implements $FaceInfoCopyWith<$Res> {
  _$FaceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faceEncoding = freezed,
  }) {
    return _then(_value.copyWith(
      faceEncoding: freezed == faceEncoding
          ? _value.faceEncoding
          : faceEncoding // ignore: cast_nullable_to_non_nullable
              as Float64List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FaceInfoCopyWith<$Res> implements $FaceInfoCopyWith<$Res> {
  factory _$$_FaceInfoCopyWith(
          _$_FaceInfo value, $Res Function(_$_FaceInfo) then) =
      __$$_FaceInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Float64List? faceEncoding});
}

/// @nodoc
class __$$_FaceInfoCopyWithImpl<$Res>
    extends _$FaceInfoCopyWithImpl<$Res, _$_FaceInfo>
    implements _$$_FaceInfoCopyWith<$Res> {
  __$$_FaceInfoCopyWithImpl(
      _$_FaceInfo _value, $Res Function(_$_FaceInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faceEncoding = freezed,
  }) {
    return _then(_$_FaceInfo(
      faceEncoding: freezed == faceEncoding
          ? _value.faceEncoding
          : faceEncoding // ignore: cast_nullable_to_non_nullable
              as Float64List?,
    ));
  }
}

/// @nodoc

class _$_FaceInfo implements _FaceInfo {
  const _$_FaceInfo({this.faceEncoding});

// String? reservedField,
  @override
  final Float64List? faceEncoding;

  @override
  String toString() {
    return 'FaceInfo(faceEncoding: $faceEncoding)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FaceInfo &&
            const DeepCollectionEquality()
                .equals(other.faceEncoding, faceEncoding));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(faceEncoding));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FaceInfoCopyWith<_$_FaceInfo> get copyWith =>
      __$$_FaceInfoCopyWithImpl<_$_FaceInfo>(this, _$identity);
}

abstract class _FaceInfo implements FaceInfo {
  const factory _FaceInfo({final Float64List? faceEncoding}) = _$_FaceInfo;

  @override // String? reservedField,
  Float64List? get faceEncoding;
  @override
  @JsonKey(ignore: true)
  _$$_FaceInfoCopyWith<_$_FaceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
