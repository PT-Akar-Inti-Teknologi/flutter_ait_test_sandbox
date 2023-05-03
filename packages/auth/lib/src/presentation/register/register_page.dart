import 'dart:convert';

import 'package:auth/src/presentation/register/cubit/register_cubit.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocListener<RegisterCubit, RegisterState>(
          listenWhen: (previous, current) =>
              previous.result == null && current.result != null,
          listener: (context, state) {
            BlocProvider.of<RegisterCubit>(context).clearResult();
            state.result!.fold(
                (l) => showDialog(
                      context: context,
                      builder: (context) => DesignDialog(
                        title: 'Failed',
                        body: l.toString(),
                        hasPositive: true,
                        positiveButtonTitle: 'OK',
                      ),
                    ),
                (r) => showDialog(
                      context: context,
                      builder: (context) => DesignDialog(
                        title: 'Success',
                        body: jsonEncode(r),
                        hasPositive: true,
                        positiveButtonTitle: 'OK',
                      ),
                    ));
          },
          child: const RegisterPageUI()),
    );
  }
}

class RegisterPageUI extends StatelessWidget {
  const RegisterPageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: BlocProvider.of<RegisterCubit>(context)
                      .generateFields(context),
                ),
              ),
            ),
          ),
          DesignButton(
            style: DesignButtonStyle.primary(context),
            child: (ctx, color) => Text('Register',
                style: DesignTextStyle.body1.overrideColor(color)),
            onTap: () => BlocProvider.of<RegisterCubit>(context).register(),
          )
        ],
      )),
    );
  }
}
