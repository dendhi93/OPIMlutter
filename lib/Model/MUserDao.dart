
import 'package:OPIMFlutter/Model/entity/MUser.dart';
import 'package:floor/floor.dart';

@dao
abstract class MUserDao{
  @insert
  Future<MUser> insertUser(MUser user);

  @Query('SELECT * FROM User')
  Future<List<MUser>> getUser();

}