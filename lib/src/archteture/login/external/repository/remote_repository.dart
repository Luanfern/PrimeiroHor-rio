import '../../../../src.dart';

class LoginRepository extends ILoginRepository{
  final IRemoteDatasource _datasource;

  LoginRepository(this._datasource);

  @override
  Future<AccountEntity> doSingIn(String phoneNumber) async {
    final signInServer = await _datasource.signInServer(phoneNumber);
    return signInServer;
  }

}