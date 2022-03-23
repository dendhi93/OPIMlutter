import 'package:floor/floor.dart';

import 'entity/MUser.dart';

@dao
abstract class MUserDao{
  @insert
  Future<void> insertUser(MUser user);

  // @Query('SELECT * FROM User')
  // Future<List<MUser>> getUser();
}