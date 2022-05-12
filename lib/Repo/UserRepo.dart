
import '../Model/database/AppDatabase.dart';
import '../Model/database/entity/MUser.dart';

class UserRepo{
  final database = $FloorAppDatabase.databaseBuilder('opim_database.db').build();
  AppDatabase _appDatabase;

  void initUserRepo(){
    database.then((onValueDb) {
      _appDatabase = onValueDb;
    });
  }

  void insertUser(MUser user) async{
    if(_appDatabase != null){
      await _appDatabase.userDAO.deleteAllUser();
      await _appDatabase.userDAO.insertUser(user);
    }
  }

  Future<String> validateUserToken() async {
    String token = "";
    database.then((onValueDb) async {
      _appDatabase = onValueDb;
       await onValueDb.userDAO.findAllUser().then((onValueQuery) => {
        if(onValueQuery != null){
          if(onValueQuery.length > 0){
            token = onValueQuery[0].userToken,
            print("token 1 " + token),
          }
        }
      });
    });
    return token;
  }

  Future<int> getMaxUser() async{
    int maxId = 0;
    if(_appDatabase != null){
      _appDatabase.userDAO.getMaxUser().then((onValueMax) => {
        if(onValueMax != null){
          maxId = onValueMax.id + 1
        }
      });
    }
    return maxId;
  }
}