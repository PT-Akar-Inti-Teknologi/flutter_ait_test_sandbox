part of '../otp_page.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = DesignTheme.of(context);
    return SizedBox(
      child: BlocSelector<OtpCubit, OtpState, String>(
          selector: (state) => state.otp,
          builder: (context, state) {
            return PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) {
                context.read<OtpCubit>().updateOtp(value);
                // context.read<OtpCubit>().onChangePin(value);
              },
              cursorColor: color.white,
              keyboardType: TextInputType.phone,
              animationType: AnimationType.fade,
              textStyle: DesignTextStyle.body1.copyWith(color: color.white),
              validator: (value) => state == '' ? 'tidak boleh kosong' : null,
              pinTheme: PinTheme(
                inactiveColor: color.neutral50,
                activeColor: color.neutral50,
              ),
              // cursorColor: color.primarySecondary,
            );
          }),
    );
  }
}
