import 'dart:async';

import 'package:common_dependency/common_dependency.dart';
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
}
