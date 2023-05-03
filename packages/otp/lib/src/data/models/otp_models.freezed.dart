// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OtpModel _$OtpModelFromJson(Map<String, dynamic> json) {
  return _OtpModel.fromJson(json);
}

/// @nodoc
mixin _$OtpModel {
  String? get otp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtpModelCopyWith<OtpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpModelCopyWith<$Res> {
  factory $OtpModelCopyWith(OtpModel value, $Res Function(OtpModel) then) =
      _$OtpModelCopyWithImpl<$Res, OtpModel>;
  @useResult
  $Res call({String? otp});
}

/// @nodoc
class _$OtpModelCopyWithImpl<$Res, $Val extends OtpModel>
    implements $OtpModelCopyWith<$Res> {
  _$OtpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OtpModelCopyWith<$Res> implements $OtpModelCopyWith<$Res> {
  factory _$$_OtpModelCopyWith(
          _$_OtpModel value, $Res Function(_$_OtpModel) then) =
      __$$_OtpModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? otp});
}

/// @nodoc
class __$$_OtpModelCopyWithImpl<$Res>
    extends _$OtpModelCopyWithImpl<$Res, _$_OtpModel>
    implements _$$_OtpModelCopyWith<$Res> {
  __$$_OtpModelCopyWithImpl(
      _$_OtpModel _value, $Res Function(_$_OtpModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
  }) {
    return _then(_$_OtpModel(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OtpModel extends _OtpModel {
  const _$_OtpModel({this.otp}) : super._();

  factory _$_OtpModel.fromJson(Map<String, dynamic> json) =>
      _$$_OtpModelFromJson(json);

  @override
  final String? otp;

  @override
  String toString() {
    return 'OtpModel(otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtpModel &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtpModelCopyWith<_$_OtpModel> get copyWith =>
      __$$_OtpModelCopyWithImpl<_$_OtpModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OtpModelToJson(
      this,
    );
  }
}

abstract class _OtpModel extends OtpModel {
  const factory _OtpModel({final String? otp}) = _$_OtpModel;
  const _OtpModel._() : super._();

  factory _OtpModel.fromJson(Map<String, dynamic> json) = _$_OtpModel.fromJson;

  @override
  String? get otp;
  @override
  @JsonKey(ignore: true)
  _$$_OtpModelCopyWith<_$_OtpModel> get copyWith =>
      throw _privateConstructorUsedError;
}
