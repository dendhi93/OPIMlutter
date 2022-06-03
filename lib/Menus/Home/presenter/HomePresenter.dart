import 'package:opim_flutter/Menus/Home/contract/HomeInterface.dart';

import '../../../Model/database/AppDatabase.dart';

class HomePresenter implements HomeInterfaceImpl{
  HomeInterfaceView homeView;
  HomePresenter(this.homeView);
  final database = $FloorAppDatabase.databaseBuilder('opim_database.db').build();

  @override
  void destroyHomeView() => homeView = null;

  @override
  // ignore: missing_return
  void initViewData() {
    database.then((onValueDb) async => {
        await onValueDb.userDAO.findAllUser().then((valueQuery) => {
            if(valueQuery != null){
              homeView?.resultView(valueQuery[valueQuery.length - 1]),
            }
        })
    });
  }

}