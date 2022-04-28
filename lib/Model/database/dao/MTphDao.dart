import 'package:floor/floor.dart';
import 'package:opim_flutter/Model/database/entity/MTph.dart';

@dao
abstract class MTphDao{
  @insert
  Future<void> insertTph(MTph tph);
}