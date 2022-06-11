import 'package:primeirohorario/src/archteture/login/domain/domain.dart';

abstract class IRemoteDatasource{
  Future<AccountEntity> signInServer(String phoneNumber);
}