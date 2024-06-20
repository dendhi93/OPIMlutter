
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
    await _appDatabase.userDAO.deleteAllUser();
    await _appDatabase.userDAO.insertUser(user);
    }

  Future<String> validateUserToken() async {
    String token = "";
    database.then((onValueDb) async {
      _appDatabase = onValueDb;
       await onValueDb.userDAO.findAllUser().then((onValueQuery) => {
        {
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
    _appDatabase.userDAO.getMaxUser().then((onValueMax) => {
      {
      maxId = onValueMax.id + 1
    }
    });
      return maxId;
  }
}