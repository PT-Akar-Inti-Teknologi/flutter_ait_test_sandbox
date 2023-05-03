import 'package:freezed_annotation/freezed_annotation.dart';
part 'otp_entity.freezed.dart';

@freezed
class OtpEntity with _$OtpEntity {
  const factory OtpEntity({
    required String otp,
    required String userId,
  }) = _OtpEntity;
}
