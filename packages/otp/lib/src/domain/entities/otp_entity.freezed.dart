// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtpEntity {
  String get otp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpEntityCopyWith<OtpEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpEntityCopyWith<$Res> {
  factory $OtpEntityCopyWith(OtpEntity value, $Res Function(OtpEntity) then) =
      _$OtpEntityCopyWithImpl<$Res, OtpEntity>;
  @useResult
  $Res call({String otp});
}

/// @nodoc
class _$OtpEntityCopyWithImpl<$Res, $Val extends OtpEntity>
    implements $OtpEntityCopyWith<$Res> {
  _$OtpEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
  }) {
    return _then(_value.copyWith(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OtpEntityCopyWith<$Res> implements $OtpEntityCopyWith<$Res> {
  factory _$$_OtpEntityCopyWith(
          _$_OtpEntity value, $Res Function(_$_OtpEntity) then) =
      __$$_OtpEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String otp});
}

/// @nodoc
class __$$_OtpEntityCopyWithImpl<$Res>
    extends _$OtpEntityCopyWithImpl<$Res, _$_OtpEntity>
    implements _$$_OtpEntityCopyWith<$Res> {
  __$$_OtpEntityCopyWithImpl(
      _$_OtpEntity _value, $Res Function(_$_OtpEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
  }) {
    return _then(_$_OtpEntity(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OtpEntity implements _OtpEntity {
  const _$_OtpEntity({required this.otp});

  @override
  final String otp;

  @override
  String toString() {
    return 'OtpEntity(otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtpEntity &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtpEntityCopyWith<_$_OtpEntity> get copyWith =>
      __$$_OtpEntityCopyWithImpl<_$_OtpEntity>(this, _$identity);
}

abstract class _OtpEntity implements OtpEntity {
  const factory _OtpEntity({required final String otp}) = _$_OtpEntity;

  @override
  String get otp;
  @override
  @JsonKey(ignore: true)
  _$$_OtpEntityCopyWith<_$_OtpEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
