import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/otp_entities.dart';

part 'otp_models.freezed.dart';
part 'otp_models.g.dart';

@freezed
class OtpModel with _$OtpModel {
  const OtpModel._();
  const factory OtpModel({
    String? otp,
  }) = _OtpModel;
  factory OtpModel.fromEntity(OtpEntity entity) => OtpModel(
        otp: entity.otp,
      );
  OtpEntity toEntity() => OtpEntity(otp: otp ?? '123');
  factory OtpModel.fromJson(Map<String, dynamic> json) =>
      _$OtpModelFromJson(json);
}
