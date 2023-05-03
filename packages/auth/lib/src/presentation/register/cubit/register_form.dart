import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class RegisterForm extends FormxMeta {
  RegisterForm()
      : super([
          FormxMetaField(
            key: 'name',
            detail: FormxTextInput(
              label: (_) => 'Name',
              textInputAction: TextInputAction.next,
              validateOnBlur: true,
            ),
            validators: [
              FormxEmptyStringValidator((_) => 'Should be filled'),
            ],
          ),
          FormxMetaField(
            key: 'email',
            detail: FormxTextInput(
              label: (_) => 'Email',
              textInputAction: TextInputAction.next,
            ),
            validators: const [
              FormxEmptyStringValidator(),
              FormxEmailValidator()
            ],
          ),
          FormxMetaField(
            key: 'password',
            detail: FormxPasswordInput(
              label: (_) => 'Password',
              textInputAction: TextInputAction.next,
            ),
            validators: [
              const FormxLengthValidator(
                  type: FormxLengthValidatorType.min, length: 6)
            ],
          ),
          FormxMetaField(
            key: 'repassword',
            detail: FormxPasswordInput(
              label: (_) => 'Password Confirmation',
              textInputAction: TextInputAction.next,
            ),
            validators: [
              const FormxLengthValidator(
                  type: FormxLengthValidatorType.min, length: 6),
              GenericFormxValidator(
                error: (_) => 'Should be same as password',
                validate: (data, [manager]) =>
                    data == manager!.formxState.fields['password']?.value,
              )
            ],
          ),
        ]);
}
