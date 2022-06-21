import 'package:dio/dio.dart';

import '../../../../../../src.dart';

class RemoteDatasource extends IRemoteDatasource {
  final Dio dio;

  RemoteDatasource(this.dio);

  @override
  Future<AccountEntity> signInServer(String phoneNumber) async {
    Response response;
    try {
      response = await dio.get(
        'http://localhost:3000/primeirohorario/login',
        queryParameters: {'phone_number': phoneNumber},
      );
      return AccountModel.fromJson(response.data).toEntity();

    } catch (e) {
      rethrow;
    }
  }
}
