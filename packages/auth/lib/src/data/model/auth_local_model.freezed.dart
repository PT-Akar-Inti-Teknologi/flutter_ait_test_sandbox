// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_local_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthLocalModel _$AuthLocalModelFromJson(Map<String, dynamic> json) {
  return _AuthLocalModel.fromJson(json);
}

/// @nodoc
mixin _$AuthLocalModel {
  @JsonKey(name: 'auth_token')
  TokenModel? get authToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'guest_token')
  TokenModel? get guestToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthLocalModelCopyWith<AuthLocalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthLocalModelCopyWith<$Res> {
  factory $AuthLocalModelCopyWith(
          AuthLocalModel value, $Res Function(AuthLocalModel) then) =
      _$AuthLocalModelCopyWithImpl<$Res, AuthLocalModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'auth_token') TokenModel? authToken,
      @JsonKey(name: 'guest_token') TokenModel? guestToken});

  $TokenModelCopyWith<$Res>? get authToken;
  $TokenModelCopyWith<$Res>? get guestToken;
}

/// @nodoc
class _$AuthLocalModelCopyWithImpl<$Res, $Val extends AuthLocalModel>
    implements $AuthLocalModelCopyWith<$Res> {
  _$AuthLocalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authToken = freezed,
    Object? guestToken = freezed,
  }) {
    return _then(_value.copyWith(
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as TokenModel?,
      guestToken: freezed == guestToken
          ? _value.guestToken
          : guestToken // ignore: cast_nullable_to_non_nullable
              as TokenModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenModelCopyWith<$Res>? get authToken {
    if (_value.authToken == null) {
      return null;
    }

    return $TokenModelCopyWith<$Res>(_value.authToken!, (value) {
      return _then(_value.copyWith(authToken: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenModelCopyWith<$Res>? get guestToken {
    if (_value.guestToken == null) {
      return null;
    }

    return $TokenModelCopyWith<$Res>(_value.guestToken!, (value) {
      return _then(_value.copyWith(guestToken: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthLocalModelCopyWith<$Res>
    implements $AuthLocalModelCopyWith<$Res> {
  factory _$$_AuthLocalModelCopyWith(
          _$_AuthLocalModel value, $Res Function(_$_AuthLocalModel) then) =
      __$$_AuthLocalModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'auth_token') TokenModel? authToken,
      @JsonKey(name: 'guest_token') TokenModel? guestToken});

  @override
  $TokenModelCopyWith<$Res>? get authToken;
  @override
  $TokenModelCopyWith<$Res>? get guestToken;
}

/// @nodoc
class __$$_AuthLocalModelCopyWithImpl<$Res>
    extends _$AuthLocalModelCopyWithImpl<$Res, _$_AuthLocalModel>
    implements _$$_AuthLocalModelCopyWith<$Res> {
  __$$_AuthLocalModelCopyWithImpl(
      _$_AuthLocalModel _value, $Res Function(_$_AuthLocalModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authToken = freezed,
    Object? guestToken = freezed,
  }) {
    return _then(_$_AuthLocalModel(
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as TokenModel?,
      guestToken: freezed == guestToken
          ? _value.guestToken
          : guestToken // ignore: cast_nullable_to_non_nullable
              as TokenModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AuthLocalModel extends _AuthLocalModel {
  const _$_AuthLocalModel(
      {@JsonKey(name: 'auth_token') this.authToken,
      @JsonKey(name: 'guest_token') this.guestToken})
      : super._();

  factory _$_AuthLocalModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthLocalModelFromJson(json);

  @override
  @JsonKey(name: 'auth_token')
  final TokenModel? authToken;
  @override
  @JsonKey(name: 'guest_token')
  final TokenModel? guestToken;

  @override
  String toString() {
    return 'AuthLocalModel(authToken: $authToken, guestToken: $guestToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthLocalModel &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.guestToken, guestToken) ||
                other.guestToken == guestToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authToken, guestToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthLocalModelCopyWith<_$_AuthLocalModel> get copyWith =>
      __$$_AuthLocalModelCopyWithImpl<_$_AuthLocalModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthLocalModelToJson(
      this,
    );
  }
}

abstract class _AuthLocalModel extends AuthLocalModel {
  const factory _AuthLocalModel(
          {@JsonKey(name: 'auth_token') final TokenModel? authToken,
          @JsonKey(name: 'guest_token') final TokenModel? guestToken}) =
      _$_AuthLocalModel;
  const _AuthLocalModel._() : super._();

  factory _AuthLocalModel.fromJson(Map<String, dynamic> json) =
      _$_AuthLocalModel.fromJson;

  @override
  @JsonKey(name: 'auth_token')
  TokenModel? get authToken;
  @override
  @JsonKey(name: 'guest_token')
  TokenModel? get guestToken;
  @override
  @JsonKey(ignore: true)
  _$$_AuthLocalModelCopyWith<_$_AuthLocalModel> get copyWith =>
      throw _privateConstructorUsedError;
}
