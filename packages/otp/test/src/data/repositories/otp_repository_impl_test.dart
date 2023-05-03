import 'package:common_dependency/common_dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:otp/src/data/datasource/otp_data_source.dart';
import 'package:otp/src/data/models/otp_models.dart';
import 'package:otp/src/data/repositories/otp_repository_impl.dart';
import 'package:otp/src/domain/entities/otp_entities.dart';

class MockOtpDataSource extends Mock implements OtpDataSource {}

void main() {
  late OtpRepositoryImpl sut;
  late OtpDataSource client;
  late OtpEntity otpEntity;
  late OtpModel otpModel;
  setUp(() {
    client = MockOtpDataSource();
    sut = OtpRepositoryImpl(client);
    otpModel = const OtpModel(otp: '123456');
    otpEntity = const OtpEntity(otp: '123456');
  });
  test(
    'should call client once',
    () async {
      await sut.verifyOtp(otpEntity);
      verify(() => client.verifyOtp(OtpModel.fromEntity(otpEntity))).called(1);
    },
  );
  test(
    'should return Right(unit) when success',
    () async {
      when(() => client.verifyOtp(otpModel)).thenAnswer((_) async => otpModel);
      final res = await sut.verifyOtp(otpEntity);
      expect(res, const Right(unit));
    },
  );
  test(
    'should return Left(serverfailure) when failed',
    () async {
      when(() => client.verifyOtp(otpModel)).thenThrow(Exception());
      final res = await sut.verifyOtp(otpEntity);
      expect(res, const Left(ServerFailure()));
    },
  );
}

