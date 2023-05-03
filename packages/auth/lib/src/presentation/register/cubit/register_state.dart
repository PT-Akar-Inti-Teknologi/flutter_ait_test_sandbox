part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState, FormxBlocStateMixin<RegisterState> {
  const RegisterState._();
  const factory RegisterState({
    required FormxState formxState,
    Either<Failure, dynamic>? result,
  }) = _RegisterState;

  @override
  RegisterState copyWithForm(FormxState state) => copyWith(formxState: state);
}
