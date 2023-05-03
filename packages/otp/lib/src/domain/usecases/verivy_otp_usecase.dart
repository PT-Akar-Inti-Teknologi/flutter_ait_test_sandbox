import 'package:common_dependency/common_dependency.dart';
import 'package:otp/src/domain/otp_entity.dart';
import 'package:otp/src/domain/repositories/otp_repository.dart';

class VerifyOtpUseCase {
  final OtpRepository otpRepository;

  VerifyOtpUseCase(this.otpRepository);

  Future<Either<Failure, Unit>> call(String otp) async {
    return await otpRepository.verifyOtp(
      OtpEntity(otp: otp, userId: '0812140'),
    );
  }
}
