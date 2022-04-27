import 'package:floor/floor.dart';
import 'package:opim_flutter/Model/database/entity/Mdivisi.dart';

@dao
abstract class MDivisiDao{
  @insert
  Future<void> insertDivisi(MDivisi division);

}