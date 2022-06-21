import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:primeirohorario/src/archteture/archteture.dart';

//TESTS
/* 
400 - Bad request - servidor não atendeu a requisição

401 - Unauthorized - cliente não autenticado

403 - Forbidden - servidor recusa responder o cliente

404 - Not Found - não encontrado

408 - Request TimeOut - Servidor derruba conexão (tempo acabou)

500 - Internal Server Error - Servidor não sabe lidar com o pedido

501 - Not Implemented - "O método da requisição não é suportado pelo servidor e não pode ser manipulado"

502 - Bad Gateway - "sta resposta de erro significa que o servidor, ao trabalhar como um gateway a fim de obter uma resposta necessária para manipular a requisição, obteve uma resposta inválida."
 */

void main() {
  Dio dioClient = Dio(BaseOptions());
  final dioAdapter = DioAdapter(dio: dioClient);
  final remoteDatasource = RemoteDatasource(dioClient);
  final loginRepository = LoginRepository(remoteDatasource);

  test('Return correctly informations of Login by phone-number', () async {
    dioAdapter.onGet('http://localhost:3000/primeirohorario/login', (server) {
      server.reply(200, {"id": 1, "name": "Luan", "phone_number": "111111"});
    }, queryParameters: {});

    final singInUsecase = SignIn(loginRepository);
    expect(
        await singInUsecase.loginAccount('1111111111'), isA<AccountEntity>());
  });

  test('Handle the 400 (Bad Request) Error', () async {
    dioAdapter.onGet('http://localhost:3000/primeirohorario/login', (server) {
      server.reply(400, null);
    }, queryParameters: {});

    expect(
      () async => await SignIn(loginRepository).loginAccount('1111111111'),
      throwsA(isA<Exception>()),
    );
  });

  test('Handle the 401 (Unauthorized) Error', () {
    dioAdapter.onGet('http://localhost:3000/primeirohorario/login', (server) {
      server.reply(401, null);
    }, queryParameters: {});

    expect(
      () async => await SignIn(loginRepository).loginAccount('1111111111'),
      throwsA(isA<Exception>()),
    );
  });

  test('Handle the 403 (Forbidden) Error', () {
    dioAdapter.onGet('http://localhost:3000/primeirohorario/login', (server) {
      server.reply(403, null);
    }, queryParameters: {});

    expect(
      () async => await SignIn(loginRepository).loginAccount('1111111111'),
      throwsA(isA<Exception>()),
    );
  });

  test('Handle the 404 (Not Found) Error', () {
    dioAdapter.onGet('http://localhost:3000/primeirohorario/login', (server) {
      server.reply(404, null);
    }, queryParameters: {});

    expect(
      () async => await SignIn(loginRepository).loginAccount('1111111111'),
      throwsA(isA<Exception>()),
    );
  });

  test('Handle the 408 (TimeOut) Error', () {
    dioAdapter.onGet('http://localhost:3000/primeirohorario/login', (server) {
      server.reply(408, null);
    }, queryParameters: {});

    expect(
      () async => await SignIn(loginRepository).loginAccount('1111111111'),
      throwsA(isA<Exception>()),
    );
  });

  test('Handle the 500 (Internal Server Error) Error', () {
    dioAdapter.onGet('http://localhost:3000/primeirohorario/login', (server) {
      server.reply(500, null);
    }, queryParameters: {});

    expect(
      () async => await SignIn(loginRepository).loginAccount('1111111111'),
      throwsA(isA<Exception>()),
    );
  });

  test('Handle the 501 (Not Implemented) Error', () {
    dioAdapter.onGet('http://localhost:3000/primeirohorario/login', (server) {
      server.reply(501, null);
    }, queryParameters: {});

    expect(
      () async => await SignIn(loginRepository).loginAccount('1111111111'),
      throwsA(isA<Exception>()),
    );
  });

  test('Handle the 502 (Bad Gateway) Error', () {
    dioAdapter.onGet('http://localhost:3000/primeirohorario/login', (server) {
      server.reply(502, null);
    }, queryParameters: {});

    expect(
      () async => await SignIn(loginRepository).loginAccount('1111111111'),
      throwsA(isA<Exception>()),
    );
  });
}
