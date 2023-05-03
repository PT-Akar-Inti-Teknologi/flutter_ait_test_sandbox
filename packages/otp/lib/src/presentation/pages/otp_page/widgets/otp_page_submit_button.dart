part of '../otp_page.dart';

class OtpPageSubmitButton extends StatelessWidget {
  const OtpPageSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = DesignTheme.of(context);
    return DesignButton(
      style: DesignButtonStyle.primary(context),
      onTap: () {},
      child: (ctx, color) => DesignText.body1(
        'Submit',
        args: TextStyle(color: colorTheme.white),
      ),
    );
  }
}
