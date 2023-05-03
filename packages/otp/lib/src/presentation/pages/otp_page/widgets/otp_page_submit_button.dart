part of '../otp_page.dart';

class OtpPageSubmitButton extends StatelessWidget {
  const OtpPageSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = DesignTheme.of(context);
    return BlocSelector<OtpCubit, OtpState, FormzStatus>(
      selector: (state) => state.status,
      builder: (context, state) {
        bool isLoading = state == FormzStatus.submissionInProgress;
        return DesignButton(
          enabled: !isLoading,
          style: DesignButtonStyle.primary(context),
          onTap: () {
            context.read<OtpCubit>().ontapButton(context);
          },
          child: (ctx, color) => isLoading
              ? const CircularProgressIndicator()
              : DesignText.body1(
                  'Submit',
                  args: TextStyle(color: colorTheme.white),
                ),
        );
      },
    );
  }
}
