// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignState {
  UserIdentity? get userIdentity => throw _privateConstructorUsedError;
  bool get hasAlreadySigned => throw _privateConstructorUsedError;
  DateTime? get lastSigned => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignStateCopyWith<SignState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignStateCopyWith<$Res> {
  factory $SignStateCopyWith(SignState value, $Res Function(SignState) then) =
      _$SignStateCopyWithImpl<$Res, SignState>;
  @useResult
  $Res call(
      {UserIdentity? userIdentity,
      bool hasAlreadySigned,
      DateTime? lastSigned});
}

/// @nodoc
class _$SignStateCopyWithImpl<$Res, $Val extends SignState>
    implements $SignStateCopyWith<$Res> {
  _$SignStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIdentity = freezed,
    Object? hasAlreadySigned = null,
    Object? lastSigned = freezed,
  }) {
    return _then(_value.copyWith(
      userIdentity: freezed == userIdentity
          ? _value.userIdentity
          : userIdentity // ignore: cast_nullable_to_non_nullable
              as UserIdentity?,
      hasAlreadySigned: null == hasAlreadySigned
          ? _value.hasAlreadySigned
          : hasAlreadySigned // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSigned: freezed == lastSigned
          ? _value.lastSigned
          : lastSigned // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignStateCopyWith<$Res> implements $SignStateCopyWith<$Res> {
  factory _$$_SignStateCopyWith(
          _$_SignState value, $Res Function(_$_SignState) then) =
      __$$_SignStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserIdentity? userIdentity,
      bool hasAlreadySigned,
      DateTime? lastSigned});
}

/// @nodoc
class __$$_SignStateCopyWithImpl<$Res>
    extends _$SignStateCopyWithImpl<$Res, _$_SignState>
    implements _$$_SignStateCopyWith<$Res> {
  __$$_SignStateCopyWithImpl(
      _$_SignState _value, $Res Function(_$_SignState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIdentity = freezed,
    Object? hasAlreadySigned = null,
    Object? lastSigned = freezed,
  }) {
    return _then(_$_SignState(
      userIdentity: freezed == userIdentity
          ? _value.userIdentity
          : userIdentity // ignore: cast_nullable_to_non_nullable
              as UserIdentity?,
      hasAlreadySigned: null == hasAlreadySigned
          ? _value.hasAlreadySigned
          : hasAlreadySigned // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSigned: freezed == lastSigned
          ? _value.lastSigned
          : lastSigned // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_SignState implements _SignState {
  const _$_SignState(
      {this.userIdentity, this.hasAlreadySigned = false, this.lastSigned});

  @override
  final UserIdentity? userIdentity;
  @override
  @JsonKey()
  final bool hasAlreadySigned;
  @override
  final DateTime? lastSigned;

  @override
  String toString() {
    return 'SignState(userIdentity: $userIdentity, hasAlreadySigned: $hasAlreadySigned, lastSigned: $lastSigned)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignState &&
            (identical(other.userIdentity, userIdentity) ||
                other.userIdentity == userIdentity) &&
            (identical(other.hasAlreadySigned, hasAlreadySigned) ||
                other.hasAlreadySigned == hasAlreadySigned) &&
            (identical(other.lastSigned, lastSigned) ||
                other.lastSigned == lastSigned));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userIdentity, hasAlreadySigned, lastSigned);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignStateCopyWith<_$_SignState> get copyWith =>
      __$$_SignStateCopyWithImpl<_$_SignState>(this, _$identity);
}

abstract class _SignState implements SignState {
  const factory _SignState(
      {final UserIdentity? userIdentity,
      final bool hasAlreadySigned,
      final DateTime? lastSigned}) = _$_SignState;

  @override
  UserIdentity? get userIdentity;
  @override
  bool get hasAlreadySigned;
  @override
  DateTime? get lastSigned;
  @override
  @JsonKey(ignore: true)
  _$$_SignStateCopyWith<_$_SignState> get copyWith =>
      throw _privateConstructorUsedError;
}
