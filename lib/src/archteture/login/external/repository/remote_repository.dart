import '../../../../src.dart';

class LoginRepository extends ILoginRepository{
  final IRemoteDatasource _datasource;

  LoginRepository(this._datasource);

  @override
  Future<AccountEntity> doSingIn(String phoneNumber) async {
    try {
      final signInServer = await _datasource.signInServer(phoneNumber);
      return signInServer;      

    } catch (e) {
      rethrow;
    }
  }

}