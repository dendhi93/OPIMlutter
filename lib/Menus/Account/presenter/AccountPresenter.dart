import '../../../Model/database/AppDatabase.dart';
import '../contract/AccountInterface.dart';
import 'package:package_info/package_info.dart';

class AccountPresenter implements AccountInterfaceImpl{
  AccountInterfaceView _accountView;
  AccountPresenter(this._accountView);
  final database = $FloorAppDatabase.databaseBuilder('opim_database.db').build();
  int idUser = 0;

  @override
  void destroyAccountView() => _accountView = null;

  @override
  void initViewData() {
    initPackageInfo();
    database.then((onValueDb) => {
      onValueDb.userDAO.findAllUser().then((valueQuery) => {
        if(valueQuery != null){
          _accountView?.resultUserView(valueQuery[valueQuery.length - 1]),
          idUser = valueQuery[valueQuery.length - 1].id,
        }
      })
    });
  }

  void initPackageInfo() async{
    final _packageInfo = await PackageInfo.fromPlatform();
    _accountView.resultVersion("Versi : " +_packageInfo.version);
  }

  @override
  void logoutProcess() {
    database.then((onValueDb) => {
      onValueDb.userDAO.updateUserLogIn(idUser),
      new Future.delayed(const Duration(seconds: 2), () {
         _accountView.goToLogin();
      })
    });
  }
}