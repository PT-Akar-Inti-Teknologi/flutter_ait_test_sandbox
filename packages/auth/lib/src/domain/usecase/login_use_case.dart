import 'package:auth_blocks/auth_blocks.dart';
import 'package:common_dependency/common_dependency.dart';

class LoginUseCase extends BaseFormUseCase<Unit> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(Map<String, dynamic> data,
      {Map<String, dynamic>? option}) async {
    final _service = await repository.login(LoginEntity(
      email: data['username'],
      password: data['password'],
    ));
    return _service.fold(
      (l) => Left(l),
      (r) => const Right(unit),
    );
  }
}
