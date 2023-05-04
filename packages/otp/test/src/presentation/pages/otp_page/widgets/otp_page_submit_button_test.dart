import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:otp/src/domain/usecases/verivy_otp_usecase.dart';
import 'package:otp/src/presentation/pages/otp_page/cubit/otp_cubit.dart';
import 'package:otp/src/presentation/pages/otp_page/otp_page.dart';
import 'package:fake_async/fake_async.dart';

class MockVerifyOtpUseCase extends Mock implements VerifyOtpUseCase {}

void main() {
  final button = find.byKey(const Key('otp_submit'));
  late VerifyOtpUseCase verifyOtpUseCase;
  setUpAll(() {
    verifyOtpUseCase = MockVerifyOtpUseCase();
    di.registerFactory(() => OtpCubit(verifyOtpUseCase)..startResendTimer());
  });
  testWidgets(
    'should enabled on start',
    (WidgetTester tester) async {
      fakeAsync(
        (async) {
          tester.pumpWidget(
            MaterialApp(
              home: Otp(),
              theme: DesignTheme.darkTheme(fontFamily: 'Satoshi').ktLet(
                (it) => it.copyWith(
                  scaffoldBackgroundColor:
                      it.extension<DesignTheme>()!.neutral0,
                ),
              ),
            ),
          );
          async.elapse(const Duration(seconds: 2));
          tester.pump();
          async.elapse(const Duration(milliseconds: 100));
        },
      );
      // expect(button, findsOneWidget);
      expect(find.textContaining('59'), findsOneWidget);
    },
  );
}
