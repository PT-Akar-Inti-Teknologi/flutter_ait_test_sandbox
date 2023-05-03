import 'dart:async';

import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otp/src/domain/usecases/verivy_otp_usecase.dart';
part 'otp_cubit.freezed.dart';
part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> with SyncEmit {
  OtpCubit(this._verifyOtpUseCase) : super(OtpState.initial());
  final VerifyOtpUseCase _verifyOtpUseCase;
  Timer? _timer;

  void onTick(Timer timer) {
    if (state.resendTimer > 0) {
      syncEmit(
        (state) => state.copyWith(
          resendTimer: state.resendTimer - 1,
        ),
      );
    } else {
      _timer!.cancel();
    }
  }

  startResendTimer() {
    // Wakelock.enable();
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  initOtpPage() {
    startResendTimer();
  }

  void updateOtp(String otp) {
    syncEmit(
      (state) => state.copyWith(
        otp: otp,
      ),
    );
  }

  void resendOtp(BuildContext context) {
    if (state.resendTimer == 0) {
      syncEmit(
        (state) => state.copyWith(
          resendTimer: 60,
        ),
      );
      startResendTimer();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          content: 'Please Wait till resend timer is 0',
        ),
      );
    }
  }

  Future<void> ontapButton(BuildContext context) async {
    syncEmit(
      (state) => state.copyWith(
        status: FormzStatus.submissionInProgress,
      ),
    );
    final res = await _verifyOtpUseCase.call(state.otp);
    syncEmit(
      (state) => state.copyWith(
        status: FormzStatus.submissionSuccess,
      ),
    );
    res.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          content: l.toString(),
        ),
      );
    }, (r) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          content: 'Otp Verified',
          textColor: Colors.green,
        ),
      );
    });
  }

  static SnackBar customSnackBar(
      {required String content, Color textColor = Colors.redAccent}) {
    return SnackBar(
      backgroundColor: Colors.black,
      key: const Key('resend_snackbar'),
      content: Text(
        content,
        style: TextStyle(color: textColor, letterSpacing: 0.5),
      ),
    );
  }
}
