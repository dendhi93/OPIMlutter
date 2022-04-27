
import 'package:floor/floor.dart';
import 'package:opim_flutter/Model/database/entity/MAncak.dart';

@dao
abstract class MAncakDao{
  @insert
  Future<void> insertAncak(MAncak ancak);
}