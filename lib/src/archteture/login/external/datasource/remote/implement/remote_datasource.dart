import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../../src.dart';

class RemoteDatasource extends IRemoteDatasource {
  final dio = Dio();

  @override
  Future<AccountEntity> signInServer(String phoneNumber) async {
    Response response = await dio.post(
      'url here',
      data: {'phoneNumber': phoneNumber},
    );

    Map<String, dynamic> jsonResponse = jsonDecode(response.data);

    return AccountModel.fromJson(jsonResponse).toEntity();
  }
}
