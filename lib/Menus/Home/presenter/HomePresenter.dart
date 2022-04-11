import 'package:opim_flutter/Menus/Home/contract/HomeInterface.dart';
import 'package:opim_flutter/Model/database/entity/MUser.dart';

import '../../../Model/database/AppDatabase.dart';

class HomePresenter implements HomeInterfaceImpl{
  HomeInterfaceView homeView;
  HomePresenter(this.homeView);
  final database = $FloorAppDatabase.databaseBuilder('opim_database.db').build();


  @override
  void destroyHomeView() => homeView = null;

  @override
  MUser initViewData() {
    database.then((onValueDb) => {
        onValueDb.userDAO.findAllUser().then((valueQuery) => {
            if(valueQuery != null){
              homeView?.resultView(valueQuery[0]),
            }
        })
    });
  }

}