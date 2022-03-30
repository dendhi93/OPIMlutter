import 'package:floor/floor.dart';

import '../entity/MUser.dart';


@dao
abstract class MUserDao{
  @insert
  Future<void> insertUser(MUser user);

  @Query('SELECT * FROM MUser order by id desc')
  Stream<List<MUser>> fetchStreamDataUser();

  @Query('SELECT * FROM MUser order by id desc limit 1')
  Future<MUser> getMaxUser();

  @delete
  Future<int> deleteAll(List<MUser> list);

  @Query('update MUser set isLoggedIn=false where id=:id')
  Future<void> updateUserLogIn(int id);

}