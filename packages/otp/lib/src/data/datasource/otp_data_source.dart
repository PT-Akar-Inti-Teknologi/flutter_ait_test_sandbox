import 'package:otp/src/data/models/otp_models.dart';

abstract class OtpDataSource {
  Future<OtpModel> verifyOtp(OtpModel body);
}

class OtpDataSourceImpl implements OtpDataSource {
  @override
  Future<OtpModel> verifyOtp(OtpModel body) async {
    await Future.delayed(const Duration(seconds: 1));
    if (body.otp == '123456') {
      return const OtpModel(otp: '123456');
    } else {
      throw Exception();
    }
  }
}
