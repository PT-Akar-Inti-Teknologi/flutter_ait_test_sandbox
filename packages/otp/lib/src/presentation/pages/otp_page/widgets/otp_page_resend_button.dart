part of '../otp_page.dart';

class OtpPageResendButton extends StatelessWidget {
  const OtpPageResendButton({super.key});

  @override
  Widget build(BuildContext context) {
    final color = DesignTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DesignText.h3('Resend in '),
        BlocSelector<OtpCubit, OtpState, int>(
            selector: (state) => state.resendTimer,
            builder: (context, state) {
              return DesignText.h3(
                state.toString(),
                args: TextStyle(
                    color: state == 0 ? color.primaryBase : color.white),
              );
            }),
      ],
    );
  }
}
