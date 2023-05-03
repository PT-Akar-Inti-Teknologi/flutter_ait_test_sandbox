import 'package:auth/src/presentation/register/cubit/register_form.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState>
    with
        SyncEmit<RegisterState>,
        FormxStateManager,
        FormxBlocMixin<RegisterState> {
  @override
  final FormxMeta formxMeta;

  RegisterCubit._({required this.formxMeta})
      : super(const RegisterState(formxState: FormxState()));

  factory RegisterCubit() {
    final instance = RegisterCubit._(formxMeta: RegisterForm());
    instance.emit(
        RegisterState(formxState: FormxState.withMeta(instance.formxMeta)));
    return instance;
  }

  @override
  List<Widget> generateFields(BuildContext context) => formxMeta.fields
      .map((e) => e.generate(context, this,
          const BlocFieldWrapper<RegisterCubit, RegisterState>()))
      .toList();

  bool register() {
    if (validateAll()) {
      syncEmit(
        (state) => state.copyWith(
          result: Right({
            'name': state.formxState.fields['name']?.value,
            'email': state.formxState.fields['email']?.value,
            'password': state.formxState.fields['password']?.value,
            'repassword': state.formxState.fields['repassword']?.value,
          }),
        ),
      );
      return true;
    }
    return false;
  }

  clearResult() {
    syncEmit((state) => state.copyWith(result: null));
  }
}
