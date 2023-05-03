part of 'otp_cubit.dart';

@freezed
class OtpState with _$OtpState {
  const OtpState._();
  factory OtpState({
    required String otp,
    required int resendTimer,
  }) = _OtpState;
  factory OtpState.initial() => OtpState(
        otp: '',
        resendTimer: 60,
      );
  bool get canResend {
    return resendTimer == 0;
  }
}
