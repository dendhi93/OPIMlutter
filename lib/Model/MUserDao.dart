import 'package:floor/floor.dart';

import 'entity/MUser.dart';

@dao
abstract class MUserDao{
  @insert
  Future<void> insertUser(MUser user);

  @Query('SELECT * FROM MUser order by id desc')
  Stream<List<MUser>> fetchStreamDataUser();

  @Query('SELECT * FROM MUser')
  Future<List<MUser>> findAllUser();

  @Query('SELECT max(id) FROM MUser')
  Future<int> getMaxUser();
}