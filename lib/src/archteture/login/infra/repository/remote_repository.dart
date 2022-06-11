import 'package:primeirohorario/src/archteture/login/domain/domain.dart';

abstract class ILoginRepository{
  Future<AccountEntity> doSingIn(String phoneNumber);
}