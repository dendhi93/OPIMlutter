import '../../../Model/database/AppDatabase.dart';
import '../contract/AccountInterface.dart';
import 'package:package_info/package_info.dart';

class AccountPresenter implements AccountInterfaceImpl{
  AccountInterfaceView _accountView;
  AccountPresenter(this._accountView);
  final database = $FloorAppDatabase.databaseBuilder('opim_database.db').build();

  @override
  void destroyAccountView() => _accountView = null;

  @override
  void initViewData() {
    initPackageInfo();
    database.then((onValueDb) => {
      onValueDb.userDAO.findAllUser().then((valueQuery) => {
        if(valueQuery != null){
          _accountView?.resultUserView(valueQuery[0]),
        }
      })
    });
  }

  void initPackageInfo() async{
    final _packageInfo = await PackageInfo.fromPlatform();
    _accountView.resultVersion("Versi : " +_packageInfo.version);
  }

}