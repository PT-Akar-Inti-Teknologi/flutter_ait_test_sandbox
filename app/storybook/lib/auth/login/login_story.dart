import 'package:auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';

class LoginStory extends WidgetbookComponent {
  LoginStory(BuildContext context)
      : super(
          name: 'Login',
          useCases: [
            WidgetbookUseCase(
              name: 'Login Page',
              builder: (context) {
                return const LocalLoginPage();
              },
            ),
          ],
        );
}
