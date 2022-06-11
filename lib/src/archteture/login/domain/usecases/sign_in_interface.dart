import 'package:primeirohorario/src/archteture/login/domain/domain.dart';

abstract class ISignIn{
  Future<AccountEntity> loginAccount(String phoneNumber);
}