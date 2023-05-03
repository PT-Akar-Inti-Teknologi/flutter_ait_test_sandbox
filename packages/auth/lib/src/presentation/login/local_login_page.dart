import 'package:auth_blocks/auth_blocks.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class LocalLoginPage extends StatelessWidget {
  const LocalLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginBlockProvider(
      provider: (_) => di<LoginCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: LoginBlockUI(
            onRegister: () => context.go(AuthNav.register.fullpath),
            onLoggedInResponse: (context, state) async {
              if (state.response!.isLeft()) {
                await showDialog(
                  context: context,
                  builder: (context) => const LoginDialogError(),
                );
              } else {
                context.go(HomeNav.home.fullpath);
              }
            },
          ),
        ),
      ),
    );
  }
}
