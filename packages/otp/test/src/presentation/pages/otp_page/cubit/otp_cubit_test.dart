import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:otp/src/domain/usecases/verivy_otp_usecase.dart';
import 'package:otp/src/presentation/pages/otp_page/cubit/otp_cubit.dart';
import 'package:fake_async/fake_async.dart';

class MockVerifyOtpUseCase extends Mock implements VerifyOtpUseCase {}

void main() {
  late VerifyOtpUseCase verifyOtpUseCase;
  late OtpCubit sut;
  setUp(
    () {
      verifyOtpUseCase = MockVerifyOtpUseCase();
      sut = OtpCubit(verifyOtpUseCase);
    },
  );

  group(
    'Resend Timer',
    () {
      List<OtpState> listState = [];
      List.generate(
        59,
        (int index) {
          listState.add(
            OtpState.initial().copyWith(
              resendTimer: 59 - index,
            ),
          );
        },
      );
      test(
        'should have initial state',
        () {
          expect(OtpState.initial(), sut.state);
          expect(60, sut.state.resendTimer);
        },
      );
      blocTest(
        'should emit timer 59 after 1 second',
        build: () => sut,
        act: (cubit) {
          fakeAsync((async) {
            sut.initOtpPage();
            async.elapse(const Duration(seconds: 1));
          });
        },
        // act: (bloc) => bloc.initOtpPage(),
        // wait: Duration(seconds: 1), //slower method
        expect: () => [
          OtpState.initial().copyWith(resendTimer: 59),
        ],
      );
      blocTest(
        'should emit timer 0 after 60 second',
        build: () => sut,
        act: (cubit) {
          fakeAsync((async) {
            sut.initOtpPage();
            async.elapse(const Duration(seconds: 59));
          });
        },
        // act: (bloc) => bloc.initOtpPage(),
        // wait: Duration(seconds: 1), //slower method
        expect: () => listState,
      );
    },
  );
}
