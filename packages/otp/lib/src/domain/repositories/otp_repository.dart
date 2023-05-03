import 'package:common_dependency/common_dependency.dart';

import '../entities/otp_entities.dart';

abstract class OtpRepository {
  Future<Either<Failure, Unit>> verifyOtp(OtpEntity body);
}
