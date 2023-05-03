import 'package:auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_local_model.freezed.dart';
part 'auth_local_model.g.dart';

enum WhichToken { guest, user }

@freezed
class AuthLocalModel with _$AuthLocalModel {
  const AuthLocalModel._();
  @JsonSerializable(explicitToJson: true)
  const factory AuthLocalModel({
    @JsonKey(name: 'auth_token') TokenModel? authToken,
    @JsonKey(name: 'guest_token') TokenModel? guestToken,
  }) = _AuthLocalModel;

  factory AuthLocalModel.fromJson(Map<String, dynamic> json) =>
      _$AuthLocalModelFromJson(json);
}
