
import 'package:floor/floor.dart';

import '../entity/MBlock.dart';

@dao
abstract class MBlockDao{
  @insert
  Future<void> insertBlock(MBlock block);

}