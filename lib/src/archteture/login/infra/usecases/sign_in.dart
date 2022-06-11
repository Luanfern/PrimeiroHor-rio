import '../../../../src.dart';

class SignIn extends ISignIn{
  final ILoginRepository _repository;

  SignIn(this._repository);

  @override
  Future<AccountEntity> loginAccount(String phoneNumber) async {
    final signInResponse = await _repository.doSingIn(phoneNumber);

    return signInResponse;
  }
}