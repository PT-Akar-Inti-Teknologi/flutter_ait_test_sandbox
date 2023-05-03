import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'cubit/otp_cubit.dart';
part 'widgets/otp_page_form.dart';
part 'widgets/otp_page_resend_button.dart';
part 'widgets/otp_page_submit_button.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<OtpCubit>()..initOtpPage(),
      child: const OtpPage(),
    );
  }
}

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = DesignTheme.of(context);
    return Scaffold(
      backgroundColor: color.neutral100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            OtpForm(
              key: Key('otp_form'),
            ),
            SizedBox(
              height: 32,
            ),
            OtpPageResendButton(
              key: Key('otp_resend'),
            ),
            SizedBox(
              height: 32,
            ),
            OtpPageSubmitButton(
              key: Key('otp_submit'),
            ),
          ],
        ),
      ),
    );
  }
}
